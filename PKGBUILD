# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev at orum dot in>

_basename=check
pkgname="lib32-$_basename"
pkgver=0.14.0
pkgrel=1
pkgdesc="A unit testing framework for C (32-bit)"
arch=('x86_64')
url="https://libcheck.github.io/check/"
license=('LGPL')
depends=('lib32-glibc' "${_basename}")
makedepends=('git' 'gcc-multilib' 'lib32-gcc-libs')
_commit=d86594e5b29d50ddbd6276ab2d2cf5c278f7656c  # tags/0.14.0
source=("git+https://github.com/libcheck/check#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $_basename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_basename
  autoreconf -fvi
}

build() {
  cd $_basename

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/lib32 
  make
}

package() {
  cd $_basename
  make DESTDIR="$pkgdir" install
  rm -rf ${pkgdir}/usr/{bin,share,include}
}
