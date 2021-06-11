# maintainer: Amr Okasha <amradel55 at gmail dot com>
# contributer:  Dimitris Kiziridis <ragouel at outlook dot com>
# modifiier: Yuzuki Tsuru <gloomyghost at gloomyghost dot com>

pkgname=com.gloomyghost.netron-bin
pkgver=4.9.6
pkgrel=6
pkgdesc="Visualizer for neural network, deep learning and machine learning models"
arch=('x86_64')
url='https://www.lutzroeder.com/ai'
license=('MIT')
provides=('netron')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/lutzroeder/netron/releases/download/v${pkgver}/Netron-${pkgver}.AppImage"
        'LICENSE::https://github.com/lutzroeder/netron/raw/main/LICENSE'
        'icon.png::https://github.com/lutzroeder/netron/raw/main/source/icon.png')
sha256sums=('8c575c4cc2a2e12e931f6cb7802ecb9ac3b432e33a5a197b64e08abd19061968'
            '535cb2c7c8990f967c106e3035e4df8d3e070144af1163b86c8bb58b65fe5e88'
            'f0f657ed7ebeb0b060a27c904c67a55fad02ebad71dd8675dde20672e5d07077')

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
          --icon "${pkgdir}/usr/share/pixmaps/icon.png"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 icon.png -t "${pkgdir}/usr/share/pixmaps/${pkgname}"
}
