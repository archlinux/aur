# Maintainer: Petr Jelinek <aur@jelineksw.com>
_pkgname=Bucardo
pkgname=bucardo
pkgver=5.6.0
pkgrel=1
epoch=
pkgdesc="An asynchronous PostgreSQL replication system, allowing for both multi-master and multi-slave operations"
arch=('any')
url="https://bucardo.org"
license=('BSD')
depends=('perl-boolean' 'perl-dbi' 'perl-dbd-pg' 'perl-dbix-safe' 'perl-encode-locale' 'perl-pod-parser')
checkdepends=('perl-test-simple')
source=("https://bucardo.org/downloads/$_pkgname-$pkgver.tar.gz"
        "https://bucardo.org/downloads/$_pkgname-$pkgver.tar.gz.asc")
md5sums=('ac318d13c9a931ab16ab4bd91652a2ab'
         'SKIP')
sha256sums=('80ec23d2f362f41bb2cf6ab18bb3d21882a7457eb1784130135152f1786fdf01'
            'SKIP')
validpgpkeys=('08A0359786047C5E1E2B8FDE374A23C9DF9B65B8')
_distdir="$_pkgname-$pkgver"

build() {
  (
    export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
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
    # TODO
    # bucardo 5.6.0 tests don't work with PG 14 because of a change of an error string between 13 and 14
    # make test
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
