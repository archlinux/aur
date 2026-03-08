# Maintainer: Huzzama <your@email.com>
pkgname=neru-screen-control
pkgver=1.0.0
pkgrel=1
pkgdesc="LCD display controller for Thermalright USB cooler screens"
arch=('any')
url="https://github.com/Huzzama/Neru-screen-control"
license=('MIT')
depends=(
  'python>=3.10'
  'python-pip'
  'libusb'
  'polkit'
)
optdepends=(
  'python-pyside6: graphical user interface'
  'python-pillow: image and frame rendering'
  'python-opencv: video playback support'
  'python-pynvml: NVIDIA GPU metrics'
)
ssource=("https://github.com/Huzzama/Neru-screen-control/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac61cc2a7c82e47f2e3a075b4c781751e83a71a9c4d85149ebe723de47c8e5b8')

prepare() {
  cd "$srcdir/Neru-screen-control-$pkgver"
  # Install Python dependencies into a local venv for packaging
  python3 -m venv .venv
  .venv/bin/pip install -r requirements.txt --quiet --no-cache-dir
}

package() {
  cd "$srcdir/Neru-screen-control-$pkgver"

  # Application source files
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r src main.py icon.png requirements.txt \
    "$pkgdir/usr/share/$pkgname/"

  # Copy venv (bundled dependencies)
  cp -r .venv "$pkgdir/usr/share/$pkgname/venv"

  # /usr/bin wrapper
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'WRAPPER'
#!/bin/bash
exec /usr/share/neru-screen-control/venv/bin/python \
     /usr/share/neru-screen-control/main.py "$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # Desktop launcher
  install -Dm644 "packaging/shared/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Icons (all sizes)
  for size in 16 32 48 64 128 256; do
    install -Dm644 \
      "packaging/shared/icons/${size}x${size}/$pkgname.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  # udev rule
  install -Dm644 "99-chizhou-display.rules" \
    "$pkgdir/usr/lib/udev/rules.d/99-chizhou-display.rules"

  # systemd service template (not enabled — user opts in via Settings)
  install -Dm644 "packaging/shared/$pkgname.service" \
    "$pkgdir/usr/share/$pkgname/$pkgname.service"

  # License
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
