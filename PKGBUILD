# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=frugalrgb
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight standalone RGB controller for PC hardware (no bloat, just LEDs)"
arch=('any')
url="https://github.com/emaspa/frugalRGB"
license=('MIT')
depends=('python' 'tk' 'python-customtkinter' 'python-ctkcolorpicker'
         'python-hidapi' 'python-pystray' 'python-pillow' 'python-smbus2')
optdepends=('python-gobject: native transparent system tray icon (StatusNotifier)'
            'libayatana-appindicator: native transparent system tray icon (StatusNotifier)')
install=frugalrgb.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa6e6ffd301f28082b000229d52c29a3ede68a40ee304525c4922897b3dfec7f')

build() {
  cd "frugalRGB-$pkgver"
  # Render the app icon (frugalrgb/icon.py is PIL-only)
  python -c "from frugalrgb.icon import create_app_icon; create_app_icon(256).save('frugalrgb.png')"
}

package() {
  cd "frugalRGB-$pkgver"

  # Application code
  install -d "$pkgdir/usr/lib/frugalrgb"
  cp -r --no-preserve=ownership frugalrgb "$pkgdir/usr/lib/frugalrgb/frugalrgb"
  find "$pkgdir/usr/lib/frugalrgb" -name __pycache__ -type d -exec rm -rf {} +
  install -Dm644 main.pyw "$pkgdir/usr/lib/frugalrgb/main.pyw"

  # Launcher
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/frugalrgb" <<'EOF'
#!/bin/sh
exec /usr/bin/python /usr/lib/frugalrgb/main.pyw "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/frugalrgb"

  # Device access + kernel modules for DRAM RGB
  install -Dm644 70-frugalrgb.rules "$pkgdir/usr/lib/udev/rules.d/70-frugalrgb.rules"
  install -d "$pkgdir/usr/lib/modules-load.d"
  printf 'i2c-dev\ni2c-piix4\ni2c-i801\n' > "$pkgdir/usr/lib/modules-load.d/frugalrgb.conf"
  chmod 644 "$pkgdir/usr/lib/modules-load.d/frugalrgb.conf"

  # Desktop integration
  install -Dm644 packaging/frugalrgb.desktop "$pkgdir/usr/share/applications/frugalrgb.desktop"
  install -Dm644 frugalrgb.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/frugalrgb.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
