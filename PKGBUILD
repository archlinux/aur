# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgbase=oxc
pkgname=(oxlint oxfmt)
pkgver=1.37.0
pkgrel=1
pkgdesc="A collection of JavaScript tools written in Rust"
arch=(x86_64)
url="https://github.com/oxc-project/oxc"
license=('MIT')
depends=('gcc-libs')
options=('!lto')
makedepends=('rust' 'cargo' 'pnpm' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oxc-project/oxc/archive/refs/tags/oxlint_v${pkgver}.tar.gz"
  oxlint.install
)
sha256sums=(
  '4e1f8858ac15faef0177ff722bf70ee9b1550a97a30d5b4bef38bcec1396f802'
  '5572432fa0cfeef8fef17dc1469e625b035171798a46930f68a2e085ceda9640'
)

prepare() {
  cd "oxc-oxlint_v${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
}

build() {
  cd "oxc-oxlint_v${pkgver}"

  cargo build --frozen --release --package oxlint

  find -name 'node_modules' -type d -exec rm -rf {} \; || true
  pnpm --filter oxfmt-app install
  pnpm --filter oxfmt-app run build
}

package_oxlint() {
  pkgdesc="Oxc JavaScript linter"
  replaces=("oxc-language-server")
  provides=("oxlint" "oxc-language-server")
  install="oxlint.install"

  cd "oxc-oxlint_v${pkgver}"

  install -Dm755 target/release/oxlint "$pkgdir/usr/bin/oxlint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# thx to nix pkg:
# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/ox/oxfmt/package.nix
package_oxfmt() {
  pkgdesc="Formatter for the JavaScript Oxidation Compiler"
  depends=("nodejs")

  cd "oxc-oxlint_v${pkgver}"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/node_modules/oxfmt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find -name 'node_modules' -type d -exec rm -rf {} \; || true
  pnpm --filter oxfmt-app install --offline --prod --ignore-scripts

  cp -r apps/oxfmt/dist "$pkgdir/usr/lib/node_modules/oxfmt/"
  cp -rL apps/oxfmt/node_modules "$pkgdir/usr/lib/node_modules/oxfmt/"
  cp npm/oxfmt/configuration_schema.json "$pkgdir/usr/lib/node_modules/oxfmt/"

  cat <<EOF >"$pkgdir/usr/bin/oxfmt"
#!/usr/bin/env node
import "/usr/lib/node_modules/oxfmt/dist/cli.js"
EOF
  chmod 0755 "$pkgdir/usr/bin/oxfmt"
}
