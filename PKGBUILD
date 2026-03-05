# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
#
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Eric Bélanger <eric@archlinux.org> 

_name=jasper
pkgname=lib32-jasper
pkgver=4.2.9
pkgrel=1
pkgdesc='Software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard'
pkgdesc+=" (32-bit, lib-only)"
url='https://www.ece.uvic.ca/~frodo/jasper/'
_git="https://github.com/jasper-software/jasper"
arch=(x86_64)
license=('LicenseRef-JasPer2.0')
depends=(
  lib32-glibc
  lib32-libjpeg-turbo
  lib32-libheif
  $_name
)
makedepends=(
  git
  cmake
)
_srcdir="${pkgname}-${pkgver}"
source=("${_srcdir}::git+${_git}#tag=version-${pkgver}")
b2sums=('a46897583ba35e0f9b125b30704d666e919d287df11f0800fe02b07663f12121c0fd80f0d9b854311c98a299f2a0e3f97aa985d7d152bdf9fff89e57fe513f6f')
provides=('libjasper.so')

prepare() {
  cd "${_srcdir}"
  sed -r 's|(CMAKE_SKIP_BUILD_RPATH) FALSE|\1 TRUE|g' -i CMakeLists.txt
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake \
    -B buildx -S ${_srcdir} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DJAS_ENABLE_LIBJPEG=ON \
    -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DJAS_ENABLE_SHARED=ON \
    -DJAS_ENABLE_32BIT=ON \
    -DJAS_ENABLE_PROGRAMS=OFF \
    -DJAS_ENABLE_DOC=OFF
  cmake --build buildx
}

check() {
  export LD_LIBRARY_PATH="$(pwd)/buildx/src/libjasper/"
  make -C buildx test
}

package() {
  make -C buildx DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/include/"

  install -Dm 644 ${_srcdir}/{NEWS.txt,README.md}  -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 ${_srcdir}/LICENSE.txt  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
