# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=flatbuffers-static
_pkgname=flatbuffers
pkgver=1.12.0
pkgrel=1
pkgdesc='An efficient cross platform serialization library for C++, with support for Java, C# and Go'
arch=(x86_64)
url='http://google.github.io/flatbuffers/'
license=(Apache)
depends=(gcc-libs)
makedepends=(cmake)
options=('staticlibs')
source=($pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('62f2223fb9181d1d6338451375628975775f7522185266cd5296571ac152bc45')
provides=('flatbuffers')
conflicts=('flatbuffers')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_FLAGS="-Wno-ignored-qualifiers -Wno-error=class-memaccess" \
    -DFLATBUFFERS_BUILD_SHAREDLIB=ON
  make
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm755 flatc -t "$pkgdir"/usr/bin
}
