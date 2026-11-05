# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Alad Wenter <alad at archlinux dot org>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Jonathas Rodrigues

pkgname=perl-orlite
_dist=ORLite
pkgver=1.98
pkgrel=4
pkgdesc='ORLite - Extremely light weight SQLite-specific ORM'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=ADAMK
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz"
        "fix_tests.patch")
sha256sums=('79e9ef07dee7feb7cafdea1a9c0432e12587fc350707a6bc72fd29502b87d021'
            'f5135d9dab28d8163e418428af346b1d9484f8513d8874c65bd3eddfe4491a97')

arch=(any)
depends=(
  perl
  perl-file-remove
  perl-dbd-sqlite
  perl-params-util
)
makedepends=(
  perl-test-script
  perl-module-install
)
options=('!emptydirs')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  patch -p1 < "$srcdir"/fix_tests.patch
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
