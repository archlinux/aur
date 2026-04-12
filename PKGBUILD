# Contributor: Margret Riegert <margret at eowyn net>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=panwriter
pkgver=0.8.10
pkgrel=1
pkgdesc='Markdown editor with pandoc integration and paginated preview'
arch=('x86_64')
url='https://panwriter.com'
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'dbus-glib'
    'libindicator'
    'libdbusmenu-gtk3'
    'nss'
)
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/mb21/panwriter/releases/download/v${pkgver}/PanWriter-${pkgver}.AppImage")
sha256sums=('993a889f169423dfceca71c719d87486baeb070494bc55295c9fa8d5420ae941')

package() {
  chmod 755 "${pkgname}-${pkgver}.AppImage"
  ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/panwriter.png "${pkgdir}/usr/share/pixmaps/panwriter.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "PanWriter" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Office;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/panwriter"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
