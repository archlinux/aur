# Maintainer: Michael Bauer <michael@m-bauer.org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rotki-bin
pkgver=1.31.2
pkgrel=2
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
sourceprefix=${pkgname%-bin}-${pkgver}
source=("${sourceprefix}.tar.xz::https://github.com/rotki/rotki/releases/download/v${pkgver}/rotki-linux_x64-v${pkgver}.tar.xz"
        "${sourceprefix}-rotki.png::https://raw.githubusercontent.com/rotki/rotki/v${pkgver}/frontend/app/public/assets/images/rotki_1024x1024.png"
        "${sourceprefix}-LICENSE::https://github.com/rotki/rotki/raw/v${pkgver}/LICENSE.md")
sha256sums=('31aee587e494904d0179a341ba2b22094d7eb616cde91fc43c0540b1730f4152'
            '391e4e2bfe352660a151b8f7143f8057ad43aafb256d4e3dfbf15546c3541270'
            'eb6f58a98d8bdb6d3c8fee3817543589f3cd0921d14748fa0630edff2d4c08b0')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin"
  ln -s /opt/rotki/rotki "${pkgdir}/usr/bin"
  tar xvf ${sourceprefix}.tar.xz -C "${pkgdir}/opt/"
  mv "${pkgdir}/opt/rotki"* "${pkgdir}/opt/rotki"
  convert ${sourceprefix}-rotki.png -resize 256x256 rotki256.png
  install -Dm644 rotki256.png "${pkgdir}/usr/share/pixmaps/rotki.png"
  install -Dm644 ${sourceprefix}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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
