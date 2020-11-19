# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tutti-quanti-shelf
pkgver=2.1.1
pkgrel=1
pkgdesc="Collection of miscellaneous developer-oriented utilities wrapped into one single app, built with Electron"
arch=('x86_64')
url='https://github.com/tonton-pixel/tutti-quanti-shelf'
license=('MIT')
depends=('nss'
         'gtk3')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tonton-pixel/tutti-quanti-shelf/archive/v${pkgver}.tar.gz")
sha256sums=('9859085f1ac526725a072d8919aea038cc0b6f185f6656ad7500b88dc46041e3')

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf "${srcdir}/npm-cache"
  mkdir ${srcdir}/npm-cache
  npm install --cache "${srcdir}/npm-cache"
  npm run build-linux
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -R "build/Tutti Quanti Shelf-linux-x64" "${pkgdir}/opt/${pkgname}"
  ln -sf "/opt/${pkgname}/Tutti Quanti Shelf" "${pkgdir}/usr/bin/${pkgname}"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Tutti Quanti Shelf" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 icons/icon-256.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
