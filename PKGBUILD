# Maintainer: Dmitry <dimflix.official@gmail.com>
pkgname=pawlette-git
conflicts=('pawlette')
provides=('pawlette')
pkgver=r1.0.0
pkgrel=1
pkgdesc="😺 Utility for changing themes in the meowrch"
arch=('any')
url="https://github.com/meowrch/pawlette"
license=('GPL-3.0')
depends=('python')
makedepends=('python-uv' 'python-virtualenv' 'git')
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
  uv sync --no-dev --frozen --compile-bytecode

  # Install application files
  cp -r . "$pkgdir/opt/$pkgname/"

  # Create launch script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pawlette" << EOF
#!/bin/sh
cd /opt/pawlette-git
exec .venv/bin/python run.py "\$@"
EOF
}
