pkgname=asmx-g3-git
pkgver=r17.c89a3ce
pkgrel=1
pkgdesc="AsmX G3 Compiler - a compiler for AsmX language"
arch=('any')
url="https://github.com/AsmXFoundation/AsmX-G3"
license=('MIT')
depends=('nodejs' 'bash')
makedepends=('git' 'npm' 'jq' 'typescript')
provides=('asmx-g3')
conflicts=('asmx-g3')
source=("git+https://github.com/AsmXFoundation/AsmX-G3.git")
sha256sums=('SKIP')

pkgver() {
  cd AsmX-G3
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Navigate to the correct directory containing package.json
  cd "$srcdir/AsmX-G3"

  # install TypeScript and Node.js typings (local dev deps)
  npm install --save-dev typescript
  npm install --save-dev @types/node

  # install dependencies but skip project "install" script
  npm install --ignore-scripts

  # build with TypeScript compiler
  npm run build
}

package() {
  cd "$srcdir/AsmX-G3"

  # install module into /usr/lib/node_modules/asmx-g3
  npm install --ignore-scripts --prefix "$pkgdir/usr/lib/node_modules/asmx-g3" .

  # remove invalid symlink created by npm
  rm -f "$pkgdir/usr/lib/node_modules/asmx-g3/node_modules/.bin/asmx"
  rm -rf "$pkgdir/usr/lib/node_modules/asmx-g3/node_modules/asmx-g3"

  # copy all sources from src
  cp -r --no-preserve=mode,ownership "$srcdir/AsmX-G3/src/." \
    "$pkgdir/usr/lib/node_modules/asmx-g3/"

  # copy node_modules including llvm.js
  cp -r --no-preserve=mode,ownership "$srcdir/AsmX-G3/node_modules/." \
    "$pkgdir/usr/lib/node_modules/asmx-g3/node_modules/"

  # fix permissions for binary
  chmod 755 "$pkgdir/usr/lib/node_modules/asmx-g3/bin/asmx"

  # create symlink for executable
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/node_modules/asmx-g3/bin/asmx" "$pkgdir/usr/bin/asmx"

  # clean references to $srcdir/$pkgdir in package.json
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # remove internal npm keys from package.json
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/asmx-g3/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # install documentation
  install -Dm644 "$srcdir/AsmX-G3/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
