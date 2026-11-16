# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=perl-file-scan-clamav
_dist=File-Scan-ClamAV
pkgdesc="File::Scan::ClamAV - Connect to a local Clam Anti-Virus clamd service"
url="https://metacpan.org/release/$_dist"

pkgver=1.95
pkgrel=9

arch=("any")
license=("Artistic-1.0-Perl OR GPL-1.0-only")

depends=(
    "clamav"
    "perl"
)
checkdepends=(
    "gzip"
    "zip"
)

source=(
    "https://cpan.metacpan.org/authors/id/E/ES/ESAYM/$_dist-$pkgver.tar.gz"
    "streamscan-new-eicar-signature.patch"
)
b2sums=(
    "34e9d6b923cc7c302f8ddb012d387a138ac378774d3e1a92fa409306a57a92a7a2d284b82de7f0fd9388cfadc722348438ddbc2cdb8dc6922ea5cac845a21880"
    "5e4debcf704fdfa519fb03ea7f1cdede7169b1fb74471e997d486bf231b7d8a4ae7c59dfd68647f273e6e35086af881eb646e25514329921ff68bbeff4630e9e"
)

options=("!emptydirs" purge)

prepare() {
    cd "$srcdir/$_dist-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/streamscan-new-eicar-signature.patch"
}

build() {
    cd "$srcdir/$_dist-$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    /usr/bin/perl Makefile.PL
    make
}

check() {
    # the .gz, .zip virus test signatures inside the package
    # are not valid (anymore), only the uncompressed file is

    # replace the compressed files with new archives 
    # containing the uncompressed test file
    cd "$srcdir/$_dist-$pkgver/testfiles"
    rm clamavtest.gz clamavtest.zip
    gzip -k clamavtest
    zip -q clamavtest.zip clamavtest

    cd "$srcdir/$_dist-$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
}

package() {
    cd "$srcdir/$_dist-$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
