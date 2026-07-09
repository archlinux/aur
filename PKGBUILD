# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Csubee <csubee@csubee.hu>
# Contributor: Neptune <neptune650@proton.me>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Saghm Rossi <aur@saghm.com>

pkgname=curseforge-appimage
pkgver=1.312.1_36055
pkgrel=1
pkgdesc="CurseForge desktop client for Linux (AppImage)"
arch=('x86_64')
depends=(
  fuse2
  glibc
  hicolor-icon-theme
  zlib
)
url="https://curseforge.com"
license=('LicenseRef-overwolf' 'MIT' 'LicenseRef-chromium-licenses')
provides=(curseforge)
conflicts=(curseforge)
options=(!strip !debug)
source=(
  "CurseForge-${pkgver/_/-}.AppImage::https://curseforge.overwolf.com/electron/linux/CurseForge-${pkgver/_/-}.AppImage"
  'LICENSE'
)
sha256sums=('d28dcbda1cb67759ee5e4b511256371a702323ce6ddea3adb7dfde5c2a0635c9'
            '135c7ffeb81f4a7ee95a5879651b679e0d1ef9d13c7aa7c262386ad97b48d62f')

prepare() {
  # mv CurseForge-*.AppImage CurseForge.AppImage
  chmod +x "CurseForge-${pkgver/_/-}.AppImage"
  ./CurseForge-${pkgver/_/-}.AppImage --appimage-extract > /dev/null
  sed -i 's/Exec=.*/Exec=\/usr\/bin\/curseforge %U/' squashfs-root/curseforge.desktop
}

package() {
  install -Dm755 "CurseForge-${pkgver/_/-}.AppImage" "${pkgdir}/opt/${pkgname}/CurseForge-${pkgver/_/-}.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/CurseForge-${pkgver/_/-}.AppImage" "${pkgdir}/usr/bin/curseforge"

  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r --no-preserve=mode,ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"

  install -Dm644 "squashfs-root/curseforge.desktop" -t "${pkgdir}/usr/share/applications"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/CURSEFORGE-LICENSE"
  install -Dm644 "squashfs-root/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "squashfs-root/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
