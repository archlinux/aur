# Maintainer: dmcslt <dmcslt@gmail.com>
pkgname=satelite-proxy-bin
pkgver=1.0.46
pkgrel=1
pkgdesc="Lightweight sing-box / Xray / mihomo desktop client with clash subscription import, rule-based routing, system proxy and TUN"
arch=('x86_64')
url="https://github.com/zn0wii/satelite-proxy"
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'librsvg')
optdepends=('sing-box: use the system sing-box core instead of the bundled one'
            'xray: use the system Xray core instead of the bundled one'
            'mihomo: use the system mihomo core instead of the bundled one')
provides=('satelite-proxy')
conflicts=('satelite-proxy')
source=("satelite-proxy-${pkgver}.AppImage::https://github.com/zn0wii/satelite-proxy/releases/download/v${pkgver}/Satelite_${pkgver}_amd64.AppImage"
        "LICENSE")
noextract=("satelite-proxy-${pkgver}.AppImage")
sha256sums=('0e45ede11bd0eb85d28fa0efdd8373b17107a7a66749773f19a20e219201e468'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

prepare() {
  cd "$srcdir"
  chmod +x "satelite-proxy-${pkgver}.AppImage"
  ./satelite-proxy-${pkgver}.AppImage --appimage-extract > /dev/null
}

package() {
  cd "$srcdir"

  install -Dm755 "squashfs-root/usr/bin/satelite-proxy" \
    "${pkgdir}/usr/bin/satelite-proxy"

  # Tauri 按 exe 相对路径 ../lib/<productName> 查找资源，目录层级不能变
  if [ -d "squashfs-root/usr/lib/Satelite" ]; then
    install -d "${pkgdir}/usr/lib"
    cp -a "squashfs-root/usr/lib/Satelite" "${pkgdir}/usr/lib/"
  fi

  # 上游仅在 AppImage 内提供 32x32 / 128x128 / 256x256@2 三档，256x256 用根目录的 Satelite.png
  for size in 32x32 128x128 256x256@2; do
    if [ -f "squashfs-root/usr/share/icons/hicolor/${size}/apps/satelite-proxy.png" ]; then
      install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}/apps/satelite-proxy.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}/apps/satelite-proxy.png"
    fi
  done
  install -Dm644 "squashfs-root/Satelite.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/satelite-proxy.png"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/satelite-proxy.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Satelite
Comment=Satelite — lightweight sing-box desktop client
Exec=satelite-proxy
StartupWMClass=satelite-proxy
Icon=satelite-proxy
Terminal=false
Categories=Network;
MimeType=x-scheme-handler/clash;x-scheme-handler/sing-box;x-scheme-handler/singbox;
EOF
  chmod 644 "${pkgdir}/usr/share/applications/satelite-proxy.desktop"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
