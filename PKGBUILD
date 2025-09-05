pkgname=asmx-stable
pkgver=29.0.0.rev1.0
pkgrel=1 pkgdesc="AsmX G3 Compiler - a compiler for AsmX language (stable release)"
arch=('any')
url="https://github.com/AsmXFoundation/AsmX-G3"
license=('MIT')
depends=('nodejs' 'bash')
makedepends=('npm' 'typescript')
provides=('asmx-stable')
conflicts=('asmx-stable' 'asmx-g3-git')
source=("https://github.com/AsmXFoundation/AsmX-G3/archive/refs/tags/v29.0.0-rev-1.0.tar.gz")
sha256sums=('54323beedcfb654d6de7e24f79ce0ee5864b4bd9884070c8568f5c03072560e3')

build() {
  cd "$srcdir/AsmX-G3-29.0.0-rev-1.0"
  npm install --ignore-scripts
  npm install --save-dev typescript
  npm install --save-dev @types/node
  npm run build
}

package() { 
  cd "$srcdir/AsmX-G3-29.0.0-rev-1.0" 
  npm install --ignore-scripts --prefix "$pkgdir/usr/lib/node_modules/asmx-stable" .
  rm -f "$pkgdir/usr/lib/node_modules/asmx-stable/node_modules/.bin/asmx"
  rm -rf "$pkgdir/usr/lib/node_modules/asmx-stable/node_modules/asmx"
  cp -r --no-preserve=mode,ownership "$srcdir/AsmX-G3-29.0.0-rev-1.0/src/." \
    "$pkgdir/usr/lib/node_modules/asmx-stable/"
  cp -r --no-preserve=mode,ownership "$srcdir/AsmX-G3-29.0.0-rev-1.0/node_modules/." \
    "$pkgdir/usr/lib/node_modules/asmx-stable/node_modules/"
  chmod 755 "$pkgdir/usr/lib/node_modules/asmx-stable/bin/asmx"
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/node_modules/asmx-stable/bin/asmx" "$pkgdir/usr/bin/asmx"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  install -Dm644 "$srcdir/AsmX-G3-29.0.0-rev-1.0/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md" 
}