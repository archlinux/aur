# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cacher
pkgver=2.33.4
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
sha256sums=('1fa76bda2685fc58c87b49017c21dd56007b43a2861bb246472ce7e071bd40de'
            '3a634ac8342a95cadb1bb2f1f84242f49ad142e495ef8e55ea02439ea9af4a9e')

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
