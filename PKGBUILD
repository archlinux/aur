pkgname=hongguo-desktop-bin
pkgver=0.2.180
pkgrel=1
pkgdesc="红果短剧桌面版（预编译 AppImage）"
arch=('x86_64')
url="https://github.com/aston314/hongguo-tv-releases"
license=('unknown')
depends=('gtk3' 'webkit2gtk-4.1' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
optdepends=(
  'noto-fonts-cjk: 中文界面字体'
  'gst-plugins-ugly: 额外媒体格式解码'
)
provides=('hongguo-desktop')
conflicts=('hongguo-desktop')
options=('!strip' '!debug')
source=("https://github.com/aston314/hongguo-tv-releases/releases/download/linux-v0.2.180-test.1/hongguo-desktop-0.2.180-x86_64.AppImage")
sha256sums=('a0eff6cfcf997aa207adf899f61cd30ccd9a87d38113dd2f298a9e34609be420')

prepare() {
  chmod +x "$srcdir/hongguo-desktop-$pkgver-x86_64.AppImage"
  rm -rf "$srcdir/squashfs-root"
  "$srcdir/hongguo-desktop-$pkgver-x86_64.AppImage" --appimage-extract >/dev/null
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"
  chmod 755 "$pkgdir/opt/$pkgname"
  find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/hongguo-tv" <<'EOF'
#!/bin/sh
exec /opt/hongguo-desktop-bin/AppRun "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/hongguo-tv"

  install -Dm644 "$srcdir/squashfs-root/hongguo-tv.desktop" "$pkgdir/usr/share/applications/hongguo-tv.desktop"
  install -Dm644 "$srcdir/squashfs-root/hongguo-tv.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/hongguo-tv.png"
}
