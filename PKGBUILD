# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=opentoonz
pkgver=1.2.0
pkgrel=1
pkgdesc='2D animation software based on Toonz Studio Ghibli Version.'
url='https://opentoonz.github.io'
license=('BSD')
arch=('x86_64')
conflicts=('opentoonz-git')
depends=('cblas' 'freeglut' 'glew' 'libmypaint' 'lzo' 'qt5-multimedia' 'qt5-script' 'sdl2' 'superlu')
makedepends=('boost' 'boost-libs' 'cmake' 'git' 'qt5-tools')
source=(
  "git+https://github.com/opentoonz/opentoonz.git#tag=v${pkgver}"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
md5sums=(
  'SKIP'
  '79edaacc7ef2f7b932a2ab3e9234570e'
  '3d8620258a66ee0f58c91ea6a38e33c1'
)

build() {
  cd "${pkgname}/thirdparty/tiff-4.0.3"
  ./configure --with-pic --disable-jbig && make
  cd -

  cmake \
    -H"${pkgname}/toonz/sources" \
    -B"${pkgname}-build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYPAINT_LIB_INCLUDE_DIRS=/usr/include/libmypaint \
    -DMYPAINT_LIB_LDFLAGS=/usr/lib/libmypaint-1.3.so
  cd "${pkgname}-build"
  make
}

package() {
  cd "${pkgname}-build"
  make DESTDIR="${pkgdir}/" install
  cd -

  install -Dm644 "${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
