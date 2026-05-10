# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=pi
pkgver=0.74.0
pkgrel=1
pkgdesc="AI coding agent for the terminal — minimal, extensible and optimized for tool use"
arch=('x86_64' 'aarch64')
url="https://github.com/earendil-works/pi"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=(
  'tmux: for background bash capabilities'
  'fd: system-provided backend for the find tool'
  'ripgrep: system-provided backend for the grep tool'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7caebc40db17568c2050d072c9e81eadb280b50f296018dd66ba25e44100be6d')

build() {
  cd "${pkgname}-${pkgver}"

  npm ci --cache "${srcdir}/npm-cache"

  # This is necessary for building web-ui, these optional packages do not get installed automatically
  npm install --include=optional --no-save --package-lock=false --cache "${srcdir}/npm-cache" \
    "@parcel/watcher@$(node -p "require('./node_modules/@parcel/watcher/package.json').version")" \
    "@tailwindcss/oxide@$(node -p "require('./node_modules/@tailwindcss/oxide/package.json').version")"

  # Running run build specifically for each target is necessary for ai package
  npm --prefix packages/tui run build
  # This is necessary to prevent ai module fetching models online in building
  ./node_modules/.bin/tsgo -p packages/ai/tsconfig.build.json
  npm --prefix packages/agent run build
  npm --prefix packages/coding-agent run build
  npm --prefix packages/web-ui run build

  npm prune --omit=dev --cache "${srcdir}/npm-cache"
}

package() {
  cd "${pkgname}-${pkgver}"

  local mod_dir="/usr/lib/node_modules/$pkgname"

  install -dm755 "$pkgdir/$mod_dir/node_modules"
  install -dm755 "$pkgdir/$mod_dir/packages" \
                 "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/doc/$pkgname"

  cp -a node_modules/. "$pkgdir/$mod_dir/node_modules/"

  local _pkg
  for _pkg in ai agent tui coding-agent web-ui; do
    install -dm755 "$pkgdir/$mod_dir/packages/$_pkg"
    cp -a "packages/$_pkg/dist" "packages/$_pkg/package.json" "packages/$_pkg/README.md" \
      "$pkgdir/$mod_dir/packages/$_pkg/"
  done

  cp -a packages/coding-agent/docs packages/coding-agent/examples \
    packages/coding-agent/CHANGELOG.md \
    "$pkgdir/$mod_dir/packages/coding-agent/"

  rm -rf "$pkgdir/$mod_dir/node_modules/koffi"
  rm -f "$pkgdir/$mod_dir/node_modules/@mariozechner/pi" \
        "$pkgdir/$mod_dir/node_modules/@mariozechner/pi-mom" \
        "$pkgdir/$mod_dir/node_modules/@mariozechner/pi-web-ui"

  ln -s "$mod_dir/packages/coding-agent/dist/cli.js" "$pkgdir/usr/bin/pi"

  cp -r packages/coding-agent/docs/* "$pkgdir/usr/share/doc/$pkgname/"
  cp -r packages/coding-agent/examples "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 packages/coding-agent/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 packages/coding-agent/CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  find "$pkgdir/$mod_dir" -type d -exec chmod 755 '{}' +
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
