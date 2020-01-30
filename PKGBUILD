# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev at orum dot in>

_basename=mtdev
pkgname="lib32-$_basename"
pkgver=1.1.6
pkgrel=1
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol (32-bit)"
arch=('x86_64')
url="https://bitmath.org/code/mtdev/"
license=('custom:MIT')
depends=('lib32-glibc' "${_basename}")
makedepends=('gcc-multilib')
source=("${url}${_basename}-${pkgver}.tar.bz2")
sha512sums=('859fb0803f330ecaae69f80713ff5a5235c0cb00de6d5ac2717ad82cea856a92b866f0c272ecfe743186abcf925f95585149ba4828b4c91555cfeb2f2a1c98f1')

build() {
  cd "$srcdir/$_basename-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/lib32 
  make
}

check() {
  cd "$srcdir/$_basename-$pkgver"
  make -k check || true
}

package() {
  cd "$srcdir/$_basename-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm -rf ${pkgdir}/usr/{bin,include,share}
}
