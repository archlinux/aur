# Maintainer: Muhammad95959 <muhammadhefzey@gmail.com>

pkgname=hyprminimizer-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimize windows to tray for Hyprland using D-Bus StatusNotifierItem"
arch=('x86_64' 'aarch64')
url="https://github.com/Muhammad95959/hyprminimizer"
license=('BSD')
depends=('nodejs>=16')
makedepends=('git' 'npm')
provides=('hyprminimizer')
conflicts=('hyprminimizer')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local desc
  desc=$(git describe --long --tags 2>/dev/null) || desc="0.1.0"
  echo "$desc" | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/$pkgname"

  npm install --production

  install -d "$pkgdir/usr/lib/hyprminimizer"
  cp -r src package.json node_modules "$pkgdir/usr/lib/hyprminimizer/"
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/hyprminimizer" << 'EOF'
#!/bin/sh
exec /usr/bin/node /usr/lib/hyprminimizer/src/index.js "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/hyprminimizer"
}
