pkgname=openchamber-desktop-appimage
pkgver=2.0.1
pkgrel=1
pkgdesc='Desktop and web interface for OpenCode AI agent'
arch=('x86_64')
url='https://github.com/openchamber/openchamber'
license=()
options=("!strip")
depends=('fuse2')
source=(
  "https://github.com/openchamber/openchamber/releases/download/v${pkgver}/OpenChamber-${pkgver}-linux-x86_64.AppImage"
)
sha512sums=('37c83fb7bb95e4786b17b84964fd697d5df7dc614094b469da65136fec0f40809654bac2e508938511fe8561a84a3195a15e1198cae45b43f1c81a8917cbab67')

_installdir=/opt/openchamber

prepare() {
  chmod a+x ./OpenChamber-${pkgver}-linux-x86_64.AppImage
  ./OpenChamber-${pkgver}-linux-x86_64.AppImage --appimage-extract >/dev/null
  sed -i "s+^Exec=.*+Exec=env ${_installdir}/OpenChamber.AppImage --no-sandbox %U+" "squashfs-root/openchamber.desktop"
  sed -i 's#Icon=openchamber#Icon=/usr/share/icons/hicolor/scalable/apps/openchamber.svg#g' squashfs-root/openchamber.desktop
}

package() {
  install -Dm755 "OpenChamber-${pkgver}-linux-x86_64.AppImage" "${pkgdir}/${_installdir}/OpenChamber.AppImage"
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/scalable/openchamber.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openchamber.svg"
  install -Dm644 "squashfs-root/openchamber.desktop" "${pkgdir}/usr/share/applications/openchamber.desktop"
}
