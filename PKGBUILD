# Maintainer: Dmitry <dimflix.official@email.com>
pkgname=mewline-git
pkgver=r31.0ccf9bb
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
exec .venv/bin/python -m mewline "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mewline"
}
