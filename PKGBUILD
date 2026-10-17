pkgname=openchamber-desktop-appimage
pkgver=2.4.0
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
sha512sums=('5213bf1263d845451347586771e1a0fbd1e90181a585b0a3584c1acc64feacf729070fd683b929044e2d6d449c4d3f455d2c7cd216e977cd8de3fc1466dde0c9')

_installdir=/opt/openchamber

prepare() {
  chmod a+x ./OpenChamber-${pkgver}-linux-x86_64.AppImage
  ./OpenChamber-${pkgver}-linux-x86_64.AppImage --appimage-extract >/dev/null
  sed -i "s+^Exec=.*+Exec=env ${_installdir}/OpenChamber.AppImage --no-sandbox %U+" "squashfs-root/openchamber.desktop"
  # 保留上游的 Icon=openchamber，由 hicolor 图标主题解析，避免写死图标格式/尺寸
}

package() {
  install -Dm755 "OpenChamber-${pkgver}-linux-x86_64.AppImage" "${pkgdir}/${_installdir}/OpenChamber.AppImage"
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/openchamber.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openchamber.png"
  install -Dm644 "squashfs-root/openchamber.desktop" "${pkgdir}/usr/share/applications/openchamber.desktop"
}
