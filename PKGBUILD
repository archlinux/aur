# Maintainer: Dmitry <dimflix.official@email.com>
pkgname=pawlette-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="😺 Utility for changing themes in the meowrch"
arch=('any')
url="https://github.com/meowrch/pawlette"
license=('GPL-3.0')
depends=(
  'python'
  'python-virtualenv'
  'git'
)
makedepends=('python-uv')
source=("git+https://github.com/meowrch/pawlette.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pawlette"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/pawlette"

  # Install virtual environment
  install -d -m755 "$pkgdir/opt/$pkgname"
  python -m venv "$pkgdir/opt/$pkgname/.venv"
  uv sync

  # Install application files
  cp -r . "$pkgdir/opt/$pkgname/"

  # Create launch script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pawlette" << EOF
#!/bin/sh
cd /opt/pawlette-git
exec .venv/bin/python run.py "\$@"
EOF

  chmod 755 "$pkgdir/usr/bin/pawlette"
}
