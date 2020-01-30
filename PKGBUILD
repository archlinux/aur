# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=perl-file-scan-clamav
_dist=File-Scan-ClamAV
pkgdesc="File::Scan::ClamAV - Connect to a local Clam Anti-Virus clamd service"
url="https://metacpan.org/release/$_dist"

pkgver=1.95
pkgrel=2

arch=('any')
license=('PerlArtistic')

depends=(
    "clamav"
    "perl"
)
makedepends=(
    "gzip"
    "zip"
)

source=(
    "https://cpan.metacpan.org/authors/id/E/ES/ESAYM/$_dist-$pkgver.tar.gz"
)
sha256sums=(
    "d2418fcc8022fb541da609df47393219514b02c4968bd92d6372d2f836639f85"
)

options=('!emptydirs' purge)


prepare() {
    # the .gz, .zip virus test signatures inside the package
    # are not valid (anymore), only the uncompressed file

    # replace the compressed files with new archives 
    # containing the uncompressed test file
    cd "$srcdir/$_dist-$pkgver/testfiles"
    rm clamavtest.gz clamavtest.zip
    gzip -k clamavtest
    zip -q clamavtest.zip clamavtest
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
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
