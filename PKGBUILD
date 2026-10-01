pkgname=openchamber-desktop-appimage
pkgver=2.1.0
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
sha512sums=('143d60120c66b7b6c42112067a3862b58409b99174d4dde39bf1c0427c9380edafd69d098c4da3f800f33b4bf4293ab7f1f6efe6001cb4ba7a4bd85a6ddcdf6c')

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
