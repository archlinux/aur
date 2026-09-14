# Maintainer: Ali Kaya <alikayaa@gmail.com>
pkgname=ragpilot
pkgver=0.9.0
pkgrel=1
pkgdesc="Token-efficient, local-first code intelligence layer for AI coding agents over MCP"
arch=('x86_64')
url="https://github.com/alikaya/ragpilot"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl')
makedepends=('cargo')
# makepkg's default LTO compiles ring's C sources to GCC LTO bitcode, which
# rust-lld cannot link: the ort-sys build script fails with undefined
# ring_core_* symbols.
options=('!lto' '!debug')
optdepends=('qdrant: vector database the index is stored in (or run qdrant in Docker)'
            'claude-code: compiler engine for the second brain')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Filled in by `updpkgsums` once the v$pkgver tag is on GitHub.
sha256sums=('d51f636e570bca3be924d95e9a3fda9819214e417f297424087a1b156c7aca67')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The fastembed/ort build script downloads the ONNX Runtime it links
  # statically, so this step needs network access even with --frozen.
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
