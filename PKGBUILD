# Maintainer: edub4rt <edub4rt@gmail.com>
pkgname=mingw-w64-physfs
_basename=physfs
pkgver=3.2.0
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (mingw-w64)"
arch=('any')
url="http://icculus.org/physfs/"
license=('ZLIB')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-zlib')
options=(staticlibs '!strip' '!buildflags' '!makeflags')
source=(https://github.com/icculus/physfs/archive/refs/tags/release-${pkgver}.tar.gz)
sha256sums=('1991500eaeb8d5325e3a8361847ff3bf8e03ec89252b7915e1f25b3f8ab5d560')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $_basename-release-$pkgver
  unset LDFLAGS
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  export CXXFLAGS="$CXXFLAGS -fno-strict-aliasing"
  sed -i 's/-Werror//g' CMakeLists.txt
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    mkdir build-${_arch}
    cd build-${_arch}
    ${_arch}-cmake \
      -DPHYSFS_BUILD_TEST=OFF \
      -DPHYSFS_BUILD_WX_TEST=OFF ..
    make all
    cd ..
  done
}

package() {
  cd $_basename-release-$pkgver
  for _arch in ${_architectures}; do
    cd build-${_arch}
    make DESTDIR=${pkgdir} install
 		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    cd ..
  done
}
