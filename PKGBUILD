# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=perl-file-scan-clamav
_dist=File-Scan-ClamAV
pkgdesc="File::Scan::ClamAV - Connect to a local Clam Anti-Virus clamd service"
url="https://metacpan.org/release/$_dist"

pkgver=1.95
pkgrel=8

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
sha256sums=(
    "d2418fcc8022fb541da609df47393219514b02c4968bd92d6372d2f836639f85"
    "8483ba0cdbdf0992c053b476fc82b9cbbea56e86f301464ffc38bc942e548233"
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
