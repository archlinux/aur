# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=slsk
pkgver=1.0.0
pkgrel=1
pkgdesc="Steam Linux Swiss Knife - A backup utility for Linux Steam games"
arch=('x86_64')
url='https://github.com/skyformat99/SLSK'
license=('Apache')
depends=('qt5-base')
makedepends=('qt5-base' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skyformat99/SLSK/archive/v${pkgver}.tar.gz")
sha256sums=('cdf68744939b409a660ff9b26a913819bd2e7e843d95b2351e068e1ac55ae588')

build() {
  cd "SLSK-${pkgver}/src"
  rm -rf build
  mkdir -p build
  cd build
  qmake PREFIX=/usr ..
  make
}

package() {
  cd "SLSK-${pkgver}/src/build"
  install -Dm755 SteamLinuxSwissKnife "${pkgdir}/opt/SLSK/slsk"
  install -Dm644 ../SteamLinuxGames.db -t "${pkgdir}/opt/SLSK/"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/SLSK/slsk "${pkgdir}/usr/bin/slsk"
  cp -avR ../../img "${pkgdir}/opt/SLSK/"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Steam Linux Swiss Knife" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 ../../img/SLSK_icon.png "${pkgdir}/usr/share/pixmaps/slsk.png"
  install -Dm644 ../../README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ../../CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}