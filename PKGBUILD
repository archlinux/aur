# Maintainer: Flakebi <flakebi@t-online.de>
_pkgname=Bucardo
pkgname=bucardo
pkgver=5.4.1
pkgrel=1
epoch=
pkgdesc="An asynchronous PostgreSQL replication system, allowing for both multi-master and multi-slave operations"
arch=('any')
url="https://bucardo.org"
license=('BSD')
depends=('perl-boolean' 'perl-dbi' 'perl-dbd-pg')
checkdepends=('perl-test-simple')
source=("http://bucardo.org/downloads/$_pkgname-$pkgver.tar.gz"
        "http://bucardo.org/downloads/$_pkgname-$pkgver.tar.gz.asc")
md5sums=('fa319e009d61d2427fb5fe2b98b4a0e7'
         'SKIP')
sha256sums=('0f080d75a7dca98c12f4d01463ba01e461c7c25c8daa383aca94202efd5d13dd'
            'SKIP')
validpgpkeys=('2529DF6AB8F79407E94445B4BC9B906714964AC8')
_distdir="$_pkgname-$pkgver"

build() {
  (
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                   \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null INSTALL_BUCARDODIR="$pkgdir"

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  (
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  (
    export INSTALL_BASE="$pkgdir"
    make install
  )

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
