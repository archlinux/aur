# Maintainer: edub4rt <edub4rt@gmail.com>
pkgname=mingw-w64-physfs
_basename=physfs
pkgver=3.0.1
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (mingw-w64)"
arch=('any')
url="http://icculus.org/physfs/"
license=('ZLIB')
makedepends=('mingw-w64-gcc' 'mingw-gcc-crt' 'mingw-w64-cmake')
depends=('mingw-w64-zlib')
options=(staticlibs '!strip' '!buildflags' '!makeflags')
source=(http://icculus.org/physfs/downloads/${_basename}-${pkgver}.tar.bz2)
sha1sums=('9959a7acad0aa30d1a86d3a418e61155b0ac533c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $_basename-$pkgver
  unset LDFLAGS
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  export CXXFLAGS="$CXXFLAGS -fno-strict-aliasing"
  sed -i 's/-Werror//g' CMakeLists.txt
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    mkdir build-${_arch}
    cd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_BUILD_TYPE=Release \
      -DPHYSFS_BUILD_TEST=OFF \
      -DPHYSFS_BUILD_WX_TEST=OFF ..
    make all
    cd ..
  done
}

package() {
  cd $_basename-$pkgver
  for _arch in ${_architectures}; do
    cd build-${_arch}
    make DESTDIR=${pkgdir} install
    cd ..
  done
}
