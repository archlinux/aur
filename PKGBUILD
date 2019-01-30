# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=opentoonz
pkgver=1.3.0
pkgrel=1
pkgdesc='This is software for producing a 2D animation.'
url='https://opentoonz.github.io'
license=('BSD')
arch=('x86_64')
conflicts=('opentoonz-git')
depends=('cblas' 'freeglut' 'glew' 'hicolor-icon-theme' 'libmypaint' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'sdl2' 'superlu')
makedepends=('boost' 'boost-libs' 'cmake' 'git' 'pkgconf' 'qt5-tools')
source=("git+https://github.com/opentoonz/opentoonz.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}/thirdparty/tiff-4.0.3/"
  ./configure --with-pic --disable-jbig && make
  
  cd "${srcdir}/"
  cmake \
    -H"${pkgname}/toonz/sources" \
    -B"${pkgname}-build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYPAINT_LIB_INCLUDE_DIRS=/usr/include/libmypaint-1.3 \
    -DMYPAINT_LIB_LDFLAGS=/usr/lib/libmypaint-1.3.so

  cd "${srcdir}/${pkgname}-build/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-build/"
  make DESTDIR="${pkgdir}/" install
  
  cd "${srcdir}/${pkgname}/"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
