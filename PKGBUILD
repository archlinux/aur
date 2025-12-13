# Maintainer: Dmitry <dimflix.official@gmail.com>
pkgname=mewline
conflicts=('mewline-git')
provides=('mewline-git')
pkgver=1.2.3
pkgrel=1
pkgdesc="😺 Elegant and extensible status bar for the meowrch distribution (stable)"
arch=('any')
url="https://github.com/meowrch/mewline"
license=('MIT')
depends=(
  'python'
  'gnome-bluetooth-3.0'
  'dart-sass'
  'gobject-introspection'
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
options=('!debug')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92f868793f1d7c5df1aecee4599ba569c66c83d7cbc32610951733d7f5a220be')

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