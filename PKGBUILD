# Maintainer: David Gro <gro.david.d@gmail.com>
pkgname=lasso-launcher
pkgrel=1
pkgdesc="LASSO Actively Simplifies System Operations. LASSO is a hackable desktop launcher, combined with a dashboard and system bar. It features a simple terminal based interface."
arch=('any')
pkgver="v25.5"
url="https://github.com/gro-david/lasso"
license=('MIT')
depends=('python' 'python-psutil' 'fzf' 'kitty')
makedepends=('git')
source=("git+https://github.com/gro-david/lasso.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/lasso"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lasso"
}

package() {
  cd "$srcdir/lasso"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r {modules,res,lasso.py,start.py} "$pkgdir/usr/share/$pkgname"

  # Create binary files
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lasso" <<EOF
#!/bin/bash
python /usr/share/$pkgname/start.py "\$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lasso-network" <<EOF
#!/bin/bash
python /usr/share/$pkgname/modules/network.py "\$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lasso-bluetooth" <<EOF
#!/bin/bash
python /usr/share/$pkgname/modules/bluetooth.py "\$@"
EOF
}
