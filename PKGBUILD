# Maintainer: oi_wtf <brainpower at gulli dot com>
# Original-Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libteam
_pkgname=libteam
pkgver=1.14
pkgrel=1
pkgdesc="Library for controlling team network device"
arch=(x86_64)
url="http://libteam.org/"
license=(LGPL2.1)
depends=(lib32-libnl lib32-libdaemon lib32-jansson lib32-libdbus)
source=($url/files/$_pkgname-$pkgver.tar.gz)
sha256sums=('294cdabd85cddfeac304ecbd4f331ef3f9afbf03f8b8ef7bb3a9c5827ab22d97')

build() {
  cd $_pkgname-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --libdir=/usr/lib32 --libexecdir=/usr/lib \
    --disable-zmq # zmq causes include error
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # lib32 cleanup
  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc"
}
