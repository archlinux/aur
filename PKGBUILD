# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgbase=oxc
pkgname=(oxlint oxfmt oxc-language-server)
pkgver=1.36.0
pkgrel=2
pkgdesc="A collection of JavaScript tools written in Rust"
arch=(x86_64)
url="https://github.com/oxc-project/oxc"
license=('MIT')
depends=('gcc-libs')
options=('!lto')
makedepends=('rust' 'cargo' 'pnpm' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oxc-project/oxc/archive/refs/tags/oxlint_v${pkgver}.tar.gz")
sha256sums=('d8a91718bf8f1f1a01d5ef14a3141f7282453085641afa1bdf53b8ee8cd20ec4')

prepare() {
  cd "oxc-oxlint_v${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
}

build() {
  cd "oxc-oxlint_v${pkgver}"

  cargo build --frozen --release --all-features

  find -name 'node_modules' -type d -exec rm -rf {} \; || true
  pnpm --filter oxfmt-app install
  pnpm --filter oxfmt-app run build
}

package_oxlint() {
  pkgdesc="Oxc JavaScript linter"
  cd "oxc-oxlint_v${pkgver}"

  install -Dm755 target/release/oxlint "$pkgdir/usr/bin/oxlint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_oxc-language-server() {
  pkgdesc="Oxc JavaScript linter language server"
  cd "oxc-oxlint_v${pkgver}"
  install -Dm755 target/release/oxc_language_server "$pkgdir/usr/bin/oxc_language_server"
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
