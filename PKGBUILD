# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=plustache
pkgver=0.4.0
pkgrel=2
pkgdesc="Basic port of mustache templating to C++"
url="https://github.com/mrtazz/plustache"
arch=( 'i686' 'x86_64' )
license=( 'MIT' )
depends=( 'boost' )
checkdepends=( 'gtest' )
options=( 'staticlibs' )
source=( "$pkgname-$pkgver.tar.gz::https://github.com/mrtazz/plustache/archive/$pkgver.tar.gz" )
md5sums=('e22a8d53650776ade11b7b0ed71258bc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e "s,boost_regex-mt,boost_regex,g" \
         -e "s,LDFLAGS=.*,\0 -version-info 3:0:3,g" \
         -e "s,-Ivendor/gtest-1.7.0/include,,g" \
         -e "s,-Lvendor/gtest-1.7.0/lib/.libs,,g" \
         Makefile.am
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
