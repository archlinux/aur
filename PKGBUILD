# Maintainer: agony <27015 at riseup dot net>

pkgname=fallow
pkgver=3.48.0
pkgrel=1
pkgdesc='Codebase intelligence for TypeScript and JavaScript'
arch=('x86_64' 'aarch64')
url='https://github.com/fallow-rs/fallow'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
install=fallow.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ad82be8abe6dbc7a482ee66e95c111968a7842d7c6b66d97dd6d63381770a51')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
  cargo fetch --locked --target host-tuple --manifest-path tools/similar-code-sidecar/Cargo.toml
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p fallow-cli -p fallow-lsp -p fallow-mcp --bin fallow --bin fallow-lsp --bin fallow-mcp
  cargo build --frozen --release --manifest-path tools/similar-code-sidecar/Cargo.toml
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(target/release/fallow --version)" == "fallow ${pkgver}" ]]
  [[ "$(target/release/fallow-lsp --version)" == "fallow-lsp ${pkgver}" ]]
  [[ "$(target/release/fallow-mcp --version)" == "fallow-mcp ${pkgver}" ]]
  [[ "$(target/release/fallow-similar-code --version)" == "fallow-similar-code ${pkgver}" ]]
  [[ "$(target/release/fallow list --entry-points --no-cache --quiet -r tests/fixtures/basic-project)" == 'src/index.ts (package.json main)' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/fallow target/release/fallow-lsp target/release/fallow-mcp target/release/fallow-similar-code -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 tools/similar-code-sidecar/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/tools/similar-code-sidecar"
}
