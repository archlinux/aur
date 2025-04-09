# Maintainer: Dmitry <dimflix.official@email.com>
pkgname=mewline-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="😺 Elegant and extensible status bar for the meowrch distribution"
arch=('any')
url="https://github.com/meowrch/mewline"
license=('MIT')
depends=(
  'python'
  'python-virtualenv'
  'git'
  'gnome-bluetooth-3.0'
  'dart-sass'
  'gray-git'
  'fabric-cli-git'
  'tesseract'
  'tesseract-data-eng'
  'tesseract-data-rus'
  'cliphist'
)
makedepends=('python-uv')
source=("git+https://github.com/meowrch/mewline.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mewline"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mewline"

  # Install virtual environment
  install -d -m755 "$pkgdir/opt/$pkgname"
  python -m venv "$pkgdir/opt/$pkgname/.venv"
  uv sync

  # Install application files
  cp -r . "$pkgdir/opt/$pkgname/"

  # Create launch script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mewline" << EOF
#!/bin/sh
cd /opt/mewline-git
exec .venv/bin/python run.py "\$@"
EOF

  # Granting rights to files and folders
  chmod -R a+rwX "$pkgdir/opt/$pkgname/src/mewline/styles"
  find "$pkgdir/opt/$pkgname/src/mewline/styles" -type d -exec chmod 777 {} +
  find "$pkgdir/opt/$pkgname/src/mewline/styles" -type f -exec chmod 666 {} +
  chmod 755 "$pkgdir/usr/bin/mewline"
}
