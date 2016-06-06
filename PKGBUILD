# Maintainer: orumin <dev@orum.in>

_basename=libsrtp
pkgname="lib32-$_basename"
pkgver=1.5.4
pkgrel=1
epoch=1
pkgdesc="Library for SRTP (Secure Realtime Transport Protocol) (32-bit)"
url="https://github.com/cisco/libsrtp"
arch=('x86_64')
license=(BSD)
depends=('lib32-glibc' 'libsrtp')
options=('staticlibs')
source=("$_basename-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('56a7b521c25134f48faff26b0b1e3d4378a14986a2d3d7bc6fefb48987304ff0')

prepare() {
  cd $_basename-$pkgver
  autoreconf -fvi
}

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 
  make libsrtp.a shared_library
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r include
}
