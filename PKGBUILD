# Maintainer: Dmitry <dimflix.official@gmail.com>
pkgname=mewline
conflicts=('mewline-git')
provides=('mewline-git')
pkgver=1.0.0
pkgrel=1
pkgdesc="😺 Elegant and extensible status bar for the meowrch distribution (stable)"
arch=('any')
url="https://github.com/meowrch/mewline"
license=('MIT')
depends=(
  'python'
  'gnome-bluetooth-3.0'
  'dart-sass'
  'gray-git'
  'fabric-cli'
  'tesseract'
  'tesseract-data-eng'
  'tesseract-data-rus'
  'cliphist'
)
makedepends=(
  'python-uv'
  'git'
  'python-virtualenv'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2e9b23f7051dfbd76a3fc482e431d674c0ba4e7c22feb740592f0534d74a8cc4')

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