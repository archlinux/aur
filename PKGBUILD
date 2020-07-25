# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=jasper
pkgname=lib32-${_pkgname}
pkgver=2.0.17
pkgrel=1
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (32-bit)"
arch=('x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('lib32-libjpeg' 'jasper')
optdepends=('jasper-doc: documentation'
            'lib32-freeglut: jiv support'
            'lib32-glu: jiv support')
makedepends=('lib32-freeglut' 'lib32-libxmu' 'lib32-glu' 'cmake')
options=('staticlibs')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/mdadams/jasper/archive/version-${pkgver}.tar.gz
        jasper-1.900.1-fix-filename-buffer-overflow.patch)
sha512sums=('9b682cfef7e951e6a78b57869fb7ddeb696aaa1b90f08c3142d2f26246ea06ed5f2cd867dae0b49ac41a792e4672db7cd96d32a46a6e99c066b7118b025a65fe'
            'b8d798bf75523c5db263783e42c653dd0cb03deee90be32eddf878bb6893cca02abadd94de6a8c737a5b7fe76f7fb245979f010765e6a95fc520b215e3a2a7f0')
b2sums=('99ff72e826be620f7209752bf94cf6324b2d5410132d5de64055d3cc40e9f008dbcfcabf725c28067954ad9947b5b2bb9c9fd982e590b25ea617229e45b4a420'
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

