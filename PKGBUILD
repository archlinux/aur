
# maintainer: Amr Okasha <amradel55 at gmail dot com>
# contributer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=netron-bin
pkgver=5.2.6
pkgrel=1
pkgdesc="Visualizer for neural network, deep learning and machine learning models"
arch=('x86_64')
url='https://www.lutzroeder.com/ai'
license=('MIT')
provides=('netron')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/lutzroeder/netron/releases/download/v${pkgver}/Netron-${pkgver}.AppImage"
        'LICENSE::https://github.com/lutzroeder/netron/raw/main/LICENSE')
sha256sums=('04ff18c109fe0560b5efca3b2bc39d02bc55bce9334f5fad3c9489c80dbf69f8'
            '535cb2c7c8990f967c106e3035e4df8d3e070144af1163b86c8bb58b65fe5e88')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/netron.png "${pkgdir}/usr/share/pixmaps/netron.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Netron" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Development;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
