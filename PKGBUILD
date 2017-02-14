# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.3.10
pkgrel=1
pkgdesc="A portable sound library"
license=(GPL LGPL)
url="http://mikmod.sourceforge.net"
arch=(x86_64)
depends=(libmikmod lib32-libpulse)
makedepends=(gcc-multilib libtool-multilib lib32-alsa-lib)
source=(http://downloads.sourceforge.net/mikmod/libmikmod-$pkgver.tar.gz)
sha256sums=('00b3f5298431864ebd069de793ec969cfea3ae6f340f6dfae1ff7da1ae24ef48')

prepare() {
  mkdir build
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  ../libmikmod-$pkgver/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share,bin}
}

