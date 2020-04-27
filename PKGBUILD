# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist
pkgver=0.7.2.rc9h
pkgrel=1
pkgdesc='A professional screenwriting software.'
url='https://kitscenarist.ru/en/'
arch=('x86_64')
license=('GPL3')
depends=('qt5-multimedia' 'qt5-webengine')
makedepends=('git' 'qt5-svg')
source=(
  "${pkgname}::git+https://github.com/dimkanovikov/KITScenarist.git#tag=${pkgver}"
  "${pkgname}.mime.xml"
)
sha256sums=(
  'SKIP'
  '513987794f8ba5a4c12aa2a65314fccdc098f86e616a416977aead29e6545b63'
)

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cd "${pkgname}/src"
  qmake \
    -spec linux-g++ \
    QMAKE_CXXFLAGS+="-Wa,--noexecstack" \
    QMAKE_LFLAGS+="-Wl,-z,--noexecstack" \
    Scenarist.pro &&
  make
}

package() {
  install -Dm755 "${pkgname}/build/Release/bin/scenarist-desktop/Scenarist" "${pkgdir}/usr/bin/${pkgname}"

  cd "${pkgname}/build/Ubuntu/scenarist_amd64/usr/share"
  install -Dm644 "applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "pixmaps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  
  cd "${srcdir}"
  install -Dm644 "${pkgname}.mime.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}
