use strict;
use warnings;

use lib '.';
use Data::Dumper;

my $person = '%FLDELRAY BEACH^JOHN$DOE$^4818 S FEDERAL BLVD^           ?;6360101062172082009=2101198299090=?#! 33435      I               1600                                   ECCECC00000?
';

my @tracks = $person =~ /(.*?\?)(.*?\?)(.*?\?)/;

print "track1: $tracks[0]\n";
my @res1 = $tracks[0] =~ m/
                            %
                            ([A-Z]{2})
                            ([^\^]{0,13})\^?
                            ([^\^]{0,35})\^?
                            ([^\^]{0,29})\^?\s*?
                            \?
                         /x;
print "track2: $tracks[1]\n";
my @res2 = $tracks[1] =~ m/
                            ;
                            (\d{6})
                            (\d{0,13})
                            \=
                            (\d{4})
                            (\d{8})
                            (\d{0,5})\=?
                            \?
                         /x;
warn Dumper \@res2;

print "-"x50 . "\n";
print "track3: $tracks[2]\n";
# #! 33445      I               1600                                   ECCECC00000?
my @res3 = $tracks[2] =~ /
                            (\#|\%)
                            (\d|\!)
                            (\d|\s)
                            ([0-9A-Z ]{11})
                            ([0-9A-Z ]{2})
                            ([0-9A-Z ]{10})
                            ([0-9A-Z ]{4})
                            ([12]{1})
                            ([0-9A-Z ]{3})
                            ([0-9A-Z ]{3})
                            ([0-9A-Z ]{3})
                            ([0-9A-Z ]{3})
                            (.*?)
                            \?
                        /x;
warn Dumper \@res3;
