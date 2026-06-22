# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=melia-appimage
pkgver=1.1.242
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
sha256sums=('864c5cde4fdd9e28c13e59b5e4aa3699f4c4941fdd5af8092a939aaa4ed9d857')

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
