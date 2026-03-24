# Maintainer: Diego Augusto <diegovsky.dev@gmail.com>

_pkgname=haxe-language-server
pkgname="${_pkgname}-git"
pkgver=0.r1685.g2e70877
pkgrel=1
pkgdesc="Language Server Protocol (LSP) implementation for the Haxe language."
arch=('any')
url="https://github.com/vshaxe/haxe-language-server"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('haxe' 'nodejs')
makedepends=('git' 'npm' 'lix')
options=(!debug)
source=("git+https://github.com/vshaxe/haxe-language-server.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.g%s" \
    "$(git describe --tags --abbrev=0 2>/dev/null || echo 0)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  npm ci
  lix run vshaxe-build -t language-server
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -r bin "$pkgdir/usr/lib/$_pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << 'EOF'
#!/usr/bin/env bash
exec node /usr/lib/haxe-language-server/bin/server.js "$@"
EOF
}
