# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cacher
pkgver=2.31.1
pkgrel=1
pkgdesc='The code snippet organizer for professional developers'
arch=('x86_64')
url='https://www.cacher.io'
license=("custom:${pkgname}")
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://s3.amazonaws.com/download.cacher.io/Cacher-${pkgver}.AppImage"
        'LICENSE')
sha256sums=('bfc579716b34ec3a65c9dcc56eb11f79dfb0985e5e1b9c94c2c9f533882541a6'
            'SKIP')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/cacher.png "${pkgdir}/usr/share/pixmaps/cacher.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Cacher" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/cacher"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}