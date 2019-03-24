# Maintainer: edub4rt <edub4rt@gmail.com>
pkgname=mingw-w64-physfs
_basename=physfs
pkgver=3.0.2
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (mingw-w64)"
arch=('any')
url="http://icculus.org/physfs/"
license=('ZLIB')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-zlib')
options=(staticlibs '!strip' '!buildflags' '!makeflags')
source=(http://icculus.org/physfs/downloads/${_basename}-${pkgver}.tar.bz2)
sha1sums=('6a15c458898d0570101d8f173201cde9ced78df7')

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
 		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    cd ..
  done
}
