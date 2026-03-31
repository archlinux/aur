pkgname=rocket-mouse-git
_pkgname=rocket-mouse
pkgver=r50.c4bcdb0
pkgrel=2
pkgdesc='Space-themed activity manager and mouse jiggler'
arch=('x86_64')
url='https://github.com/willakins/rocket-mouse'
license=('ISC')
options=('!debug')
depends=('electron39' 'libxtst')
makedepends=('cmake' 'git' 'npm' 'png++')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "${_pkgname}::git+${url}.git#branch=main"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)
sha256sums=(
  'SKIP'
  'c3ab16e0459b5ca8e6af712cddad3295fcb6b344d7acc5429ae8c6dd831b1e21'
  '7d8211d89f62271d5e510eb0a1ec24bbec7aecae8f1a91ef59163dc1f9279bc8'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export HOME="$srcdir/.home"
  export npm_config_cache="$srcdir/npm-cache"
  npm install --no-audit --no-fund
  npm run build

  local electron_runtime_dir="$srcdir/${_pkgname}-electron-dist"
  rm -rf "$electron_runtime_dir"
  cp -r node_modules/electron/dist "$electron_runtime_dir"

  npm prune --omit=dev
}

package() {
  cd "$srcdir/$_pkgname"

  local appdir="$pkgdir/usr/lib/$_pkgname"
  local electron_runtime_dir="$srcdir/${_pkgname}-electron-dist"

  install -dm755 "$appdir"
  cp -r main.js package.json src node_modules "$appdir/"
  cp -r "$electron_runtime_dir" "$appdir/electron"

  install -Dm755 \
    "$srcdir/${_pkgname}.sh" \
    "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 \
    "$srcdir/${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 \
    src/renderer/assets/icon.png \
    "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
