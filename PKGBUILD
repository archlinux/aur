# Maintainer: Martchus <martchus@gmx.net>
_name=c++utilities
_reponame=cpp-utilities
pkgname=mingw-w64-c++utilities
pkgver=3.1.1
pkgrel=1
arch=('any')
pkgdesc="Common C++ classes and routines used by my applications such as argument parser, IO and conversion utilities (mingw-w64)."
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("c++utilities-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('6d94b823b9ec8e645e79f6bcdfed65bc2c8d3e3ac748f5ce969af1680cee9274')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  # build utilities for each architecture
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/${_arch}" ../
    make
    popd
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make install-mingw-w64-strip
    popd
  done
}
