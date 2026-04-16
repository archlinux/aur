# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pi-mono
pkgname=pi
pkgver=0.67.5
pkgrel=1
pkgdesc="AI coding agent for the terminal — minimal, extensible and optimized for tool use"
arch=('x86_64' 'aarch64')
url="https://github.com/badlogic/pi-mono"
license=('MIT')
depends=('nodejs>=20')
makedepends=('npm')
optdepends=(
  'tmux: for background bash capabilities'
  'fd: system-provided backend for the find tool'
  'ripgrep: system-provided backend for the grep tool'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('796b6e4a42ce7fd7485068536a80c174341fa52836fe8370adc7505e50943fe0')

build() {
  cd "${_pkgname}-${pkgver}"

  export npm_config_cache="${srcdir}/npm-cache"

  mkdir -p "$npm_config_cache"

  npm ci --ignore-scripts --cache "$npm_config_cache" \
    --workspace packages/tui \
    --workspace packages/ai \
    --workspace packages/agent \
    --workspace packages/coding-agent \
    --include-workspace-root

  npm --prefix packages/tui run build
  ./node_modules/.bin/tsgo -p packages/ai/tsconfig.build.json
  npm --prefix packages/agent run build
  npm --prefix packages/coding-agent run build

  npm prune --omit=dev --ignore-scripts --cache "$npm_config_cache" \
    --workspace packages/tui \
    --workspace packages/ai \
    --workspace packages/agent \
    --workspace packages/coding-agent \
    --include-workspace-root
}

package() {
  cd "${_pkgname}-${pkgver}"

  local mod_dir="/usr/lib/node_modules/$pkgname"

  install -dm755 "$pkgdir/$mod_dir/node_modules"
  install -dm755 "$pkgdir/$mod_dir/packages" \
                 "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/doc/$pkgname"

  cp -a node_modules/. "$pkgdir/$mod_dir/node_modules/"

  install -dm755 "$pkgdir/$mod_dir/packages/ai" \
                 "$pkgdir/$mod_dir/packages/agent" \
                 "$pkgdir/$mod_dir/packages/tui" \
                 "$pkgdir/$mod_dir/packages/coding-agent"

  cp -a packages/ai/dist packages/ai/package.json packages/ai/README.md \
    "$pkgdir/$mod_dir/packages/ai/"
  cp -a packages/agent/dist packages/agent/package.json packages/agent/README.md \
    "$pkgdir/$mod_dir/packages/agent/"
  cp -a packages/tui/dist packages/tui/package.json packages/tui/README.md \
    "$pkgdir/$mod_dir/packages/tui/"
  cp -a packages/coding-agent/dist packages/coding-agent/docs packages/coding-agent/examples \
    packages/coding-agent/package.json packages/coding-agent/README.md packages/coding-agent/CHANGELOG.md \
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
