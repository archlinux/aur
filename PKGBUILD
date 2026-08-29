pkgname=openchamber-desktop-appimage
pkgver=1.21.1
pkgrel=2
pkgdesc='Desktop and web interface for OpenCode AI agent'
arch=('x86_64')
url='https://github.com/openchamber/openchamber'
license=()
options=("!strip")
depends=('fuse2')
source=(
  "https://github.com/openchamber/openchamber/releases/download/v${pkgver}/OpenChamber-${pkgver}-linux-x86_64.AppImage"
)
sha512sums=('0d314cac3c64c1f3baf5f8bfb27268b3dcf785bbbfec99302c97f945b04abe98e294bcd42247a82544993bf59ff7e35324a83dea844e2011a743bfd6899b99d9')

_installdir=/opt/openchamber

prepare() {
  chmod a+x ./OpenChamber-${pkgver}-linux-x86_64.AppImage
  ./OpenChamber-${pkgver}-linux-x86_64.AppImage --appimage-extract >/dev/null
  sed -i "s+^Exec=.*+Exec=env ${_installdir}/OpenChamber.AppImage --no-sandbox %U+" "squashfs-root/openchamber.desktop"
  sed -i 's#Icon=openchamber#Icon=/usr/share/icons/hicolor/1024x1024/apps/openchamber.png#g' squashfs-root/openchamber.desktop
}

package() {
  install -Dm755 "OpenChamber-${pkgver}-linux-x86_64.AppImage" "${pkgdir}/${_installdir}/OpenChamber.AppImage"
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/openchamber.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/openchamber.png"
  install -Dm644 "squashfs-root/openchamber.desktop" "${pkgdir}/usr/share/applications/openchamber.desktop"
}
