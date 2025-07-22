# Maintainer: David Birks <david@birks.dev>

pkgname=openai-codex-rust
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight coding agent that runs in your terminal (Rust rewrite)"
url="https://github.com/openai/codex"
license=('Apache-2.0')
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'openssl' 'tree-sitter' 'tree-sitter-bash' 'oniguruma')
makedepends=('cargo' 'clang' 'tree-sitter' 'tree-sitter-bash' 'oniguruma')
optdepends=()
provides=('codex')
conflicts=('openai-codex' 'openai-codex-bin' 'codex')
options=('!debug')

source=("https://github.com/openai/codex/archive/refs/tags/rust-v${pkgver}.tar.gz")
sha256sums=('f8cfe4d38efc0e297d44f33cb17c744977b25076e7c4d85e3d038c402bc36441')

prepare() {
  cd "${srcdir}/codex-rust-v${pkgver}/codex-rs"
  cargo fetch
}

build() {
  cd "${srcdir}/codex-rust-v${pkgver}/codex-rs"
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
  export RUSTFLAGS="-L /usr/lib -l tree-sitter -l tree-sitter-bash -l onig"
  cargo build --release --frozen --target-dir=target
}

package() {
  cd "${srcdir}/codex-rust-v${pkgver}/codex-rs"
  install -Dm755 target/release/codex                "${pkgdir}/usr/bin/codex"
  install -Dm755 target/release/codex-exec           "${pkgdir}/usr/bin/codex-exec"
  install -Dm755 target/release/codex-linux-sandbox  "${pkgdir}/usr/bin/codex-linux-sandbox"

  cd "${srcdir}/codex-rust-v${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

