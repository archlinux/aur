# Maintainer: Flakebi <flakebi@t-online.de>
_pkgname=Bucardo
pkgname=bucardo
pkgver=5.5.0
pkgrel=2
epoch=
pkgdesc="An asynchronous PostgreSQL replication system, allowing for both multi-master and multi-slave operations"
arch=('any')
url="https://bucardo.org"
license=('BSD')
depends=('perl-boolean' 'perl-dbi' 'perl-dbd-pg' 'perl-dbix-safe')
checkdepends=('perl-test-simple')
source=("http://bucardo.org/downloads/$_pkgname-$pkgver.tar.gz"
        "http://bucardo.org/downloads/$_pkgname-$pkgver.tar.gz.asc")
md5sums=('1e49f61f30251b99f7c2521efe83c316'
         'SKIP')
sha256sums=('14ca09a7394fd63029b583a01e2d04b438d4860af2dac109c6a3352e517abb2d'
            'SKIP')
validpgpkeys=('08A0359786047C5E1E2B8FDE374A23C9DF9B65B8')
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
