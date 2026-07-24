pkgname=orca-note-appimage
pkgver=1.87.1
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
sha512sums=('62d1e89312eed8b07eee6d8a1dc2018bd3c37f2ef84f54f970acd66c4cb0e95774d22907dd16011570d71ff928abb85d8c59deb2123b6eb76fac550a6529d37e')

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
