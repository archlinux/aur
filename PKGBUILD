# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=melia-appimage
pkgver=1.1.427
pkgrel=1
pkgdesc="A privacy-first desktop email client (AppImage)"
arch=('x86_64')
depends=(
  fuse
  hicolor-icon-theme
)
url="https://melia.buxjr.com"
license=('LicenseRef-melia')
provides=(melia)
conflicts=(melia)
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/buxjr311/melia-app/releases/download/v${pkgver}/melia_${pkgver}_x64.AppImage")
sha256sums=('792029344b53bf8e1ac4f1c6c8705e339421f41ca4aeff21fd3b89e0c37a3a16')

prepare() {
  chmod +x "${pkgname}-${pkgver}.AppImage"
  ./${pkgname}-${pkgver}.AppImage --appimage-extract > /dev/null
}

package() {
  install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/melia"

  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r --no-preserve=mode,ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"

  install -Dm644 "squashfs-root/Melia.desktop" -t "${pkgdir}/usr/share/applications"

  install -Dm644 "squashfs-root/usr/lib/melia/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "squashfs-root/usr/lib/melia/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
