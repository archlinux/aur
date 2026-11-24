pkgname=orca-note-appimage
pkgver=1.101.0
pkgrel=1
pkgdesc='一款既适合大纲写作，也适合长篇写作的笔记应用'
arch=('x86_64')
url='https://orca-studio.com/orcanote/zh/'
license=()
options=("!strip")
depends=('fuse2')
source=(
  "https://github.com/sethyuan/orca-note/releases/download/v${pkgver}/orcanote-linux-x86_64-${pkgver}.AppImage"
)
sha512sums=('32aa2a70bb5f516cfc81e87281ee58604925e3af6e7cd3dd30f182d19ec2c32d4c56fd3fc80091f83f4f040690a6156f54054c849f0ad1b2e0d38b0843b33765')

_installdir=/opt/orca-note

prepare() {
  chmod a+x ./orcanote-linux-x86_64-${pkgver}.AppImage
  ./orcanote-linux-x86_64-${pkgver}.AppImage --appimage-extract >/dev/null
  sed -i "s+Exec=AppRun --no-sandbox %U+Exec=env ${_installdir}/orcanote.AppImage --no-sandbox %U+" "squashfs-root/orca.desktop"
  sed -i 's#Icon=orca#Icon=/usr/share/icons/hicolor/apps/orcanote.png#g' squashfs-root/orca.desktop
}

package() {
  install -Dm755 "orcanote-linux-x86_64-${pkgver}.AppImage" "${pkgdir}/${_installdir}/orcanote.AppImage"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/*/apps/orca.png "${pkgdir}/usr/share/icons/hicolor/apps/orcanote.png"
  install -Dm644 "squashfs-root/orca.desktop" "${pkgdir}/usr/share/applications/orca-note.desktop"
}
