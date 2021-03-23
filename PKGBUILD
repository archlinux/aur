# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=jasper
pkgname=lib32-${_pkgname}
pkgver=2.0.27
pkgrel=1
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (32-bit)"
arch=('x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('lib32-glibc' 'lib32-libjpeg' 'jasper')
optdepends=('jasper-doc: documentation'
            'lib32-freeglut: jiv support'
            'lib32-glu: jiv support')
makedepends=('lib32-freeglut' 'lib32-libxmu' 'lib32-glu' 'cmake')
options=('staticlibs')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/mdadams/jasper/archive/version-${pkgver}.tar.gz
        jasper-1.900.1-fix-filename-buffer-overflow.patch)
sha512sums=('c5d336d8364d593a785b65e7114e33cc53638e28d3b5101a8f20da653a116a54b684d5d285cb4e6ddd786ff5f294781291f3675fa5078fc69eb3a4a8ef155ea9'
            'b8d798bf75523c5db263783e42c653dd0cb03deee90be32eddf878bb6893cca02abadd94de6a8c737a5b7fe76f7fb245979f010765e6a95fc520b215e3a2a7f0')
b2sums=('90fa565bc8b196950c7e0d3fd295f3c7a9082fbaac5696d351cec659671a6c3e7c87b01872c88974f3501277c57e13747660c8f89b4b7c9fd17698bdf1a8b54d'
        '9b1927a437ed9b32491f07a210600b5a7d10711ec954dadc030a8238b67e9c6d1a8e67956fd7a5515e7060f0a1651fa86763e21d6d20592f8f00e9d3260722a1')

prepare() {
  cd ${_pkgname}-version-${pkgver}
  patch -p1 < "${srcdir}/jasper-1.900.1-fix-filename-buffer-overflow.patch"
  sed -r 's|(CMAKE_SKIP_BUILD_RPATH) FALSE|\1 TRUE|g' -i CMakeLists.txt
}

build() {
  cd ${_pkgname}-version-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  local options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32
    -DCMAKE_BUILD_TYPE=Release
    -DJAS_ENABLE_OPENGL=ON
    -DJAS_ENABLE_LIBJPEG=ON
    -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF
    -DCMAKE_SKIP_RPATH=ON
    -DJAS_ENABLE_DOC=OFF                # Do not build documentation - is already available in extra/jasper-doc
  )

  echo "Building static lib..."
  cmake \
    -B build-static \
    "${options[@]}" \
    -DJAS_ENABLE_SHARED=OFF
  make -C build-static

  echo "Building shared lib..."
  cmake \
    -B build-shared \
    "${options[@]}" \
    -DJAS_ENABLE_SHARED=ON
  make -C build-shared
}

check() {
  cd ${_pkgname}-version-${pkgver}/build-static
  make -j1 test
}

package() {
  cd ${_pkgname}-version-${pkgver}
  make -C build-static DESTDIR="${pkgdir}" install
  make -C build-shared DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

