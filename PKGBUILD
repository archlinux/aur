pkgname=openchamber-desktop-appimage
pkgver=1.24.1
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
sha512sums=('4b56344cb0fa0767bce1547d0c36c5809c80a314cf9bdb393a3962b79affd4219a71ed6940086bea87774ccbc2229cd5b5ea148c378838222a72779385ba5246')

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
