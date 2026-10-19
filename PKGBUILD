# Maintainer: runxhq <dev@runx.ai>
pkgname=runx
pkgver=0.10.2
pkgrel=1
pkgdesc="Native governed runtime for agent skills, tools, graphs, and packets."
arch=('x86_64' 'aarch64')
url="https://runx.ai"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('runx-bin')
# The release profile strips symbols, so a debug package would be empty, and
# full debug info makes the whole-program link exceed 7 GB. rustc links with
# lld, which cannot read the GCC LTO objects that makepkg's lto option makes of
# the bundled C libraries (sqlite, zstd, ring).
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/runxhq/runx/archive/refs/tags/cli-v$pkgver.tar.gz")
sha256sums=('aafca4abd3b2acebcd825c34195711159292bdd41a569f5fc7fe69f2d099b8da')

prepare() {
  cd "$pkgname-cli-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path crates/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-cli-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --manifest-path crates/Cargo.toml -p runx-cli -p runx-js-worker
}

package() {
  cd "$pkgname-cli-v$pkgver"
  install -Dm755 target/release/runx "$pkgdir/usr/bin/runx"
  install -Dm755 target/release/runx-js-worker "$pkgdir/usr/bin/runx-js-worker"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
