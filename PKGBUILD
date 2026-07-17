# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=mewline
conflicts=('mewline-git')
provides=('mewline-git')
pkgver=2.2.1
pkgrel=1
pkgdesc="Status bar for the meowrch distribution. Supports hyprland/bspwm."
arch=('any')
url="https://github.com/meowrch/mewline"
license=('MIT')
depends=(
  'python'
  'power-profiles-daemon'
  'gnome-bluetooth-3.0'
  'dart-sass'
  'gobject-introspection'
  'gray-git'
  'fabric-cli'
  'tesseract'
  'tesseract-data-eng'
  'tesseract-data-rus'
  'cliphist'
  'brightnessctl'
  'ddcutil'
  'slop'
  'scrot'
)
makedepends=(
  'python-uv'
  'git'
  'python-virtualenv'
)
install=mewline.install
options=('!debug')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0611223beffd6978f5fd626b8139a74adc19ed813e62f4f5470c884a1c334113')

package() {
  cd "$srcdir/mewline-$pkgver"

  # Install virtual environment
  install -d -m755 "$pkgdir/opt/$pkgname"
  python -m venv "$pkgdir/opt/$pkgname/.venv"
  uv sync --no-dev --frozen --compile-bytecode

  # Install application files
  cp -r . "$pkgdir/opt/$pkgname/"

  # Create launch script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mewline" << EOF
#!/bin/sh
cd /opt/mewline
exec .venv/bin/python run.py "\$@"
EOF

  # Granting rights to files and folders
  chmod -R a+rwX "$pkgdir/opt/$pkgname/src/mewline/styles"
  find "$pkgdir/opt/$pkgname/src/mewline/styles" -type d -exec chmod 777 {} +
  find "$pkgdir/opt/$pkgname/src/mewline/styles" -type f -exec chmod 666 {} +
}