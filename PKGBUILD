# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>

# Builds the tagged release from source. The PKGBUILD in the project's own
# pkgbuild/ folder is a different thing: it packages a local checkout for
# `bin/install` and never downloads anything.
#
# To release: set pkgver, run `updpkgsums`, regenerate .SRCINFO with
# `makepkg --printsrcinfo > .SRCINFO`, and push both.

pkgname=omascan
pkgver=0.1.0
pkgrel=1
pkgdesc="Keyboard-first document scanner for Omarchy, from SANE scanner to PDF"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemy/omascan"
license=('MIT')
depends=(
  'qt6-base'          # also QtDBus (portal) and QtConcurrent (PDF export)
  'qt6-declarative'   # Qt Quick, Material style, QtQuick.Shapes
  'qt6-svg'           # the window and launcher icon
  'qt6-wayland'
  'xdg-desktop-portal' # the save dialog
  'sane'              # scanimage, which omascan runs for every scan
  'sane-airscan'      # driverless eSCL/WSD network scanners
)
optdepends=('ipp-usb: driverless scanners connected over USB')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f83d8d7494160c96c76bef373826555502862904f25cfae77ae6b153b649ea41')

build() {
  mkdir -p build
  cd build
  qmake6 "../${pkgname}-${pkgver}/omascan.pro"
  make
}

check() {
  mkdir -p tests
  cd tests
  qmake6 "../${pkgname}-${pkgver}/tests/omascan_tests.pro"
  make
  QT_QPA_PLATFORM=offscreen ./omascan_tests
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ../build/omascan "${pkgdir}/usr/bin/omascan"
  install -Dm644 pkgbuild/omascan.desktop "${pkgdir}/usr/share/applications/omascan.desktop"
  install -Dm644 pkgbuild/omascan.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/omascan.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
