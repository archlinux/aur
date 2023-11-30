# Maintainer: Michael Bauer <michael@m-bauer.org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rotki-bin
pkgver=1.31.0
pkgrel=1
pkgdesc='A portfolio tracking, analytics, accounting and tax reporting application that respects your privacy'
arch=('x86_64')
url="https://rotki.com"
license=('BSD')
provides=('rotki')
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.tar.xz")
depends=('gtk3'
         'nss')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.xz::https://github.com/rotki/rotki/releases/download/v${pkgver}/rotki-linux_x64-v${pkgver}.tar.xz"
        "rotki.png::https://raw.githubusercontent.com/rotki/rotki/v${pkgver}/frontend/app/public/assets/images/rotki_1024x1024.png"
        "LICENSE::https://github.com/rotki/rotki/raw/v${pkgver}/LICENSE.md")
sha256sums=('8c09429510ac78b494de8f5b02684e6301cdd272c4306519076b7b75823989fc'
            '391e4e2bfe352660a151b8f7143f8057ad43aafb256d4e3dfbf15546c3541270'
            'eb6f58a98d8bdb6d3c8fee3817543589f3cd0921d14748fa0630edff2d4c08b0')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin"
  ln -s /opt/rotki/rotki "${pkgdir}/usr/bin"
  tar xvf ${pkgname%-bin}-${pkgver}.tar.xz -C "${pkgdir}/opt/"
  mv "${pkgdir}/opt/rotki"* "${pkgdir}/opt/rotki"
  convert rotki.png -resize 256x256 rotki256.png
  install -Dm644 rotki256.png "${pkgdir}/usr/share/pixmaps/rotki.png"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Rotki" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Office;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 ${pkgname%-bin}.desktop -t "${pkgdir}/usr/share/applications"
  find "${pkgdir}/opt" -type f -exec chmod o-w {} +
  find "${pkgdir}/opt" -type d -exec chmod o-w {} +
}
# vim:set ts=2 sw=2 et:
