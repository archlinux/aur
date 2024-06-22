# Maintainer: Furkan Sahin furkansahin824@gmail.com
pkgname=vscode-js-debug
pkgver=1.90.0
pkgrel=1
pkgdesc='A VS Code debugger for JavaScript & TypeScript, powered by the Microsoft vscode-js-debug'
arch=(any)
url="https://github.com/microsoft/vscode-js-debug"
license=(MIT)
depends=(nodejs)
makedepends=(
  git
  npm
)
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/vscode-js-debug/archive/refs/tags/v${pkgver}.tar.gz")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

_server="dapDebugServer.js"

build() {
  cd $pkgname
  npm install --legacy-peer-deps
  # A VS Code user would probably prefer to get this through VS Code store
  # So I'm assuming users of this package need it for generic DAP
  npx gulp dapDebugServer
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname
  install -d "$pkgdir"/{usr/bin,$mod_dir}

  cd $pkgname/dist
  install -D -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE

  # Preprend server with shebang for standalone execution
  sed -i '1i #!/usr/bin/env node' "src/$_server"
  chmod +x "src/$_server"

  cp -r src "$pkgdir/$mod_dir"

  # Sym link an executable into /usr/bin
  ln -s "$mod_dir/src/$_server" "$pkgdir/usr/bin/$_server"
}
