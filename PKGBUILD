pkgname=openchamber-desktop-appimage
pkgver=2.0.0
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
sha512sums=('b87ba7df9770331e526e40d1fa5b38b5d4ece4efffbce34d8769673c5cf1bdb596bd3dec9724e265f44b7928bb5bb0cdf4190b794706ac592fbe162d143d08b8')

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
