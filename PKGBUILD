# Maintainer: Diego Augusto <diegovsky.dev@gmail.com>

_pkgname=haxe-language-server
pkgname="${_pkgname}-git"
pkgver=2e70877
pkgrel=1
pkgdesc="Language Server Protocol (LSP) implementation for the Haxe language."
arch=('any')
url="https://github.com/vshaxe/haxe-language-server"
license=('MIT')
privides=(haxe-language-server-git)
depends=('haxe' 'nodejs')
makedepends=('npm' 'lix')
source=("git+https://github.com/vshaxe/haxe-language-server.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long --always | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/$_pkgname"

  npm install
  lix run vshaxe-build -t language-server
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -r bin "$pkgdir/usr/lib/$_pkgname/"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$_pkgname" << 'EOF'
#!/usr/bin/env bash
exec node /usr/lib/haxe-language-server/bin/server.js "$@"
EOF

  chmod +x "$pkgdir/usr/bin/$_pkgname"
}
