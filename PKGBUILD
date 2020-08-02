# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=portfall-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="A desktop k8s port-forwarding portal for easy access to all your cluster UIs"
arch=('x86_64')
url='https://rekon.uk/2020/04/portfall-a-desktop-k8s-port-forwarding-portal-for-easy-access-to-all-your-cluster-uis'
license=('MIT')
provides=('portfall')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/rekon-oss/portfall/releases/download/v${pkgver}/Portfall-x86_64.AppImage"
        'LICENSE::https://github.com/rekon-oss/portfall/raw/master/LICENSE')
sha256sums=('d666308f453bf5dcff281304b3bb30065554fe531ceecb7a7e134286841998f6'
            '0f6798f263a13080ef7988de3e9fd4d71ff20b6690052e1b434843c55dcaa897')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/appicon.png "${pkgdir}/usr/share/pixmaps/portfall.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Portfall" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Network;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/portfall"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}