# Maintainer: MAGPINY BO <magpinyb at proton dot me>
pkgname=sysinfoviewer
pkgver=0.2.4
pkgrel=1
pkgdesc="A comprehensive system information viewer built with wxWidgets"
arch=('x86_64' 'aarch64')
url="https://github.com/Magpiny/sysinfoviewer"
license=('MIT')
depends=('wxwidgets-gtk3' 'curl' 'alsa-lib')
makedepends=('cmake') 
optdepends=(
  'lm_sensors: Additional hardware monitoring support'
  'smartmontools: Disk health information'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Magpiny/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6f88940c83923bacf223b8893e5558794e887b9ee5edfeac3e96d8463467fb70')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Wno-dev
  
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  DESTDIR="${pkgdir}" cmake --install build
  
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  fi
  
  if [ -f "${pkgname}.desktop" ]; then
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  fi
  
  if [ -f "icons/${pkgname}.png" ]; then
    install -Dm644 "icons/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  fi
  
  if [ -f "docs/${pkgname}.1" ]; then
    install -Dm644 "docs/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  fi
}
