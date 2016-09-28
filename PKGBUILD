# $Id: PKGBUILD 187712 2016-08-26 18:17:33Z stativ $
# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=pion
pkgver=5.0.7
pkgrel=7
pkgdesc="A C++ development library for implementing lightweight HTTP interfaces"
url="https://github.com/cloudmeter/pion"
arch=('i686' 'x86_64')
license=('custom:Boost')
depends=('boost-libs' 'openssl' 'log4cpp')
makedepends=('boost')
provides=('pion-net')
conflicts=('pion-net')
replaces=('pion-net')
source=($pkgname-$pkgver.zip::https://github.com/cloudmeter/pion/archive/$pkgver.zip)
md5sums=('76a96dd4d34d21e41cbb2328564cba1a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh

  # override configure bug (forces debug even when nobody asked for it)
  sed -i "s/ -ggdb//g" configure
  # override Makefile bug
  sed -i "/docs:/ s/doxygen-doc//" Makefile.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix build with GCC 6
  CXXFLAGS+=' -std=gnu++98'

  ./configure --prefix=/usr --with-plugins=/usr/lib/pion/plugins --disable-doxygen-doc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # tests fail to compile with Boost 1.59.0
  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # install license
  install -D -m0755 COPYING "$pkgdir/usr/share/licenses/$pkgname/Boost"
}
