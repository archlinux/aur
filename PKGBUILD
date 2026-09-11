# Maintainer: chen-shuhan <2502820816@qq.com>
# 非官方社区打包
pkgname=vantage-browser-appimage
pkgver=153.2.0
pkgrel=1
pkgdesc="Vantage 浏览器 - 基于 Firefox ESR (AppImage 封装) - 非官方社区打包"
arch=('x86_64' 'aarch64')
url="https://github.com/asystech-chen/Vantage"
license=('MPL-2.0')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
optdepends=(
  'ffmpeg: media playback'
)
provides=('vantage-browser')
conflicts=('vantage-browser' 'vantage-browser-bin')
source_x86_64=("https://github.com/asystech-chen/Vantage/releases/download/v${pkgver}-${pkgrel}/vantage-${pkgver}-${pkgrel}.x86_64.AppImage")
source_aarch64=("https://github.com/asystech-chen/Vantage/releases/download/v${pkgver}-${pkgrel}/vantage-${pkgver}-${pkgrel}.aarch64.AppImage")
sha256sums_x86_64=('da57eabd96f4fbb84f8467261c312d01469e5ddb8771346cf5567d46a829f9ca')
sha256sums_aarch64=('403f79e636069ea8ff137ec192493cd77b1d61123f12ea98b7170cfef52cf35a')

noextract=("vantage-${pkgver}-${pkgrel}.x86_64.AppImage" "vantage-${pkgver}-${pkgrel}.aarch64.AppImage")

package() {
  cd "$srcdir"
  # 根据架构选择对应 AppImage
  if [ "$CARCH" = "aarch64" ]; then
    _appimage="vantage-${pkgver}-${pkgrel}.aarch64.AppImage"
  else
    _appimage="vantage-${pkgver}-${pkgrel}.x86_64.AppImage"
  fi

  install -Dm755 "$_appimage" "$pkgdir/opt/vantage/vantage.AppImage"
  # 提取 AppImage 内桌面文件与图标（若可用）
  if ./"$_appimage" --appimage-extract "vantage.desktop" >/dev/null 2>&1; then
    install -Dm644 squashfs-root/vantage.desktop "$pkgdir/usr/share/applications/vantage.desktop" 2>/dev/null || true
    rm -rf squashfs-root
  fi
  # 回退：创建最小桌面文件
  if [ ! -f "$pkgdir/usr/share/applications/vantage.desktop" ]; then
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/vantage.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Vantage
GenericName=Web Browser
Comment=Vantage Browser - AppImage
Exec=/opt/vantage/vantage.AppImage %u
Icon=vantage
Terminal=false
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;
DESKTOP
  else
    sed -i 's|^Exec=.*|Exec=/opt/vantage/vantage.AppImage %u|' "$pkgdir/usr/share/applications/vantage.desktop"
  fi

  # 符号链接
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/vantage/vantage.AppImage "$pkgdir/usr/bin/vantage"

  # 图标
  if [ -f "$pkgdir/opt/vantage/vantage.png" ]; then
    install -Dm644 "$pkgdir/opt/vantage/vantage.png" "$pkgdir/usr/share/pixmaps/vantage.png"
  fi

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'LICENSE'
MPL-2.0 - See https://github.com/asystech-chen/Vantage/blob/main/LICENSE
LICENSE
}
