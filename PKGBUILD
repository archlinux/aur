# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgbase=oxc
pkgname=(oxlint oxfmt)
pkgver=1.76.0
pkgrel=1
pkgdesc="A collection of JavaScript tools written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/oxc-project/oxc"
license=('MIT')
depends=('gcc-libs')
options=('!lto')
makedepends=('rust' 'cargo' 'pnpm' 'cmake' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oxc-project/oxc/archive/refs/tags/oxlint_v${pkgver}.tar.gz"
  oxlint.install
)
sha256sums=(
  '7db154e9242c561603a2fe8dd00831993de2afc156927be7c5cd311840cb5069'
  '287cbed847b3fdf8bc5fcc7d35f7437121bbec2a7b6ac998137385bfabc03861'
)

prepare() {
  cd "oxc-oxlint_v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "oxc-oxlint_v${pkgver}"

  # test -e target/release/oxlint || \
  cargo build --frozen --release --package oxlint

  # test -e apps/oxfmt/dist/oxfmt.linux-x64-gnu.node && return
  find -name 'node_modules' -type d -exec rm -rf {} \; || true
  pnpm --filter oxfmt-app install
  pnpm --filter oxfmt-app run build
}

package_oxlint() {
  pkgdesc="Oxc JavaScript linter"
  replaces=("oxc-language-server")
  conflicts=("oxc-language-server")
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
