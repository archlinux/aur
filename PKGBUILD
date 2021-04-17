# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=jasper
pkgname=lib32-${_pkgname}
pkgver=2.0.28
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
sha512sums=('13a47efc3b3d10e0680e7cf0637a417df0920e1ca8af20f2206303d0a14753688f7e6c6b3383f6db946effca389754e5736e286ed45d5b643b422f5600223eab'
            'b8d798bf75523c5db263783e42c653dd0cb03deee90be32eddf878bb6893cca02abadd94de6a8c737a5b7fe76f7fb245979f010765e6a95fc520b215e3a2a7f0')
b2sums=('a04d745b2eca2395ea73e117c58171ab34ad6f2368e5c6c6768ed5fdb656b30c2a1c9f110f981e027f01af0636514d4b16f4be5c0528ed3a072d7fa66321b2d8'
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

