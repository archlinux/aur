# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=pi
pkgver=0.75.3
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
sha256sums=('76c5bd518b8139fac9e3a672422b8a943b93b190cb3ef6a4405a161a7d85e1fc')

build() {
  cd "${pkgname}-${pkgver}"

  npm ci --cache "${srcdir}/npm-cache"

  # This is necessary for building web-ui, these optional packages do not get installed automatically
  npm install --include=optional --no-save --package-lock=false --cache "${srcdir}/npm-cache" \
    "@parcel/watcher@$(node -p "require('./node_modules/@parcel/watcher/package.json').version")" \
    "@tailwindcss/oxide@$(node -p "require('./node_modules/@tailwindcss/oxide/package.json').version")"

  # Running run build specifically for each package is necessary to prevent ai package issue
  npm --prefix packages/tui run build
  # This is necessary to prevent ai module fetching models on network in building
  ./node_modules/.bin/tsgo -p packages/ai/tsconfig.build.json
  npm --prefix packages/agent run build
  npm --prefix packages/coding-agent run build
  npm --prefix packages/web-ui run build

  # Remove packages which are only necessary in development / building
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

  # Copy all necessary files for all packages except coding-agent
  local _pkg
  for _pkg in ai agent tui web-ui; do
    install -dm755 "$pkgdir/$mod_dir/packages/$_pkg"
    cp -a "packages/$_pkg/dist" "packages/$_pkg/package.json" "packages/$_pkg/README.md" \
      "$pkgdir/$mod_dir/packages/$_pkg/"
  done

  # Copy all necessary files for coding-agent as it also includes docs and examples and CHANGELOG.md
  install -dm755 "$pkgdir/$mod_dir/packages/coding-agent"
  cp -a packages/coding-agent/dist packages/coding-agent/docs packages/coding-agent/examples \
    packages/coding-agent/package.json packages/coding-agent/README.md packages/coding-agent/CHANGELOG.md \
    "$pkgdir/$mod_dir/packages/coding-agent/"

  # This package is only useful in windows installation, therefore remove it
  rm -rf "$pkgdir/$mod_dir/node_modules/koffi"

  ln -s "$mod_dir/packages/coding-agent/dist/cli.js" "$pkgdir/usr/bin/pi"

  # Copy coding-agent docs and README and CHANGELOG into /usr/share/doc/pi to align it with Arch packages
  cp -r packages/coding-agent/docs/* "$pkgdir/usr/share/doc/$pkgname/"
  cp -r packages/coding-agent/examples "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 packages/coding-agent/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 packages/coding-agent/CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
