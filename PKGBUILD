pkgname=orca-note-appimage
pkgver=1.71.0
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
sha512sums=('7d91819a27fe132bebae8b718c2e6bc5bead228d485da22e8c411878a23ed8bec003332301863d45940f1ae732b8db8d52f90f6db081c50196b878c8ae1f6dbf')

_installdir=/opt/orca-note

prepare() {
  chmod a+x ./orcanote-linux-x86_64-${pkgver}.AppImage
  ./orcanote-linux-x86_64-${pkgver}.AppImage --appimage-extract >/dev/null
  sed -i "s+Exec=AppRun --no-sandbox %U+Exec=env ${_installdir}/orcanote.AppImage --no-sandbox %U+" "squashfs-root/orca.desktop"
  sed -i 's#Icon=orca#Icon=/usr/share/icons/hicolor/apps/orcanote.png#g' squashfs-root/orca.desktop
}

package() {
  install -Dm755 "orcanote-linux-x86_64-${pkgver}.AppImage" "${pkgdir}/${_installdir}/orcanote.AppImage"
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/orca.png" "${pkgdir}/usr/share/icons/hicolor/apps/orcanote.png"
  install -Dm644 "squashfs-root/orca.desktop" "${pkgdir}/usr/share/applications/orcanote.desktop"
}
