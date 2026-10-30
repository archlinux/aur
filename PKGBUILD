# Maintainer: agony <27015 at riseup dot net>

pkgname=merman
pkgver=0.9.3
pkgrel=1
pkgdesc='Mermaid.js, but headless, in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/Latias94/merman'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('40f7186eac6e15a522cc28cc5e47ad6bebc0545a30a22d8e5e40f68e1cd799f9')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p merman-cli
  cargo build --frozen --release -p merman-lsp --features all-diagrams,stdio
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The skipped test scans the host fonts and fails above 16 MiB of cmap tables
  cargo test --frozen --release -p merman-cli -- \
    --skip system_fonts_require_explicit_native_measurement_or_system_opt_in
  cargo test --frozen --release -p merman-lsp --features all-diagrams,stdio
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/merman-cli target/release/merman-lsp -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd crates/merman-cli/assets
  install -Dm644 completions/merman-cli.bash "${pkgdir}/usr/share/bash-completion/completions/merman-cli"
  install -Dm644 completions/merman-cli.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 completions/_merman-cli -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm644 man/*.1 -t "${pkgdir}/usr/share/man/man1"
}
