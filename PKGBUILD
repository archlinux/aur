# Maintainer: Muhammed Dali <support@ardali.app>

pkgname=ardali-browser
pkgver=6.0.0
pkgrel=1
pkgdesc="Native Qt/C++ desktop browser with integrated privacy and media tools"
arch=('x86_64')
url="https://github.com/Muhammed-Dali/ArDali-Browser"
license=('GPL-3.0-only')
depends=(
  'ffmpeg'
  'openssl'
  'qt6-base'
  'qt6-svg'
  'qt6-webengine'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'nodejs'
)
provides=('ardali' 'ardali-webmedia')
conflicts=('ardali' 'ardali-bin' 'ardali-webmedia' 'aurivo-bin')
replaces=('ardali-bin' 'ardali-webmedia')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Muhammed-Dali/ArDali-Browser/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cmake \
    -S "ArDali-Browser-${pkgver}/browser" \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_BINDIR=lib/ardali-browser
  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen QTWEBENGINE_DISABLE_SANDBOX=1 \
    ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ../lib/ardali-browser/ardali-browser "${pkgdir}/usr/bin/ardali-browser"

  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/ardali-browser %U|' \
    -e 's|^TryExec=.*|TryExec=/usr/bin/ardali-browser|' \
    "${pkgdir}/usr/share/applications/ardali-browser.desktop"

  install -Dm644 "ArDali-Browser-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "ArDali-Browser-${pkgver}/browser/resources/adblock/NOTICE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.adblock"
}
