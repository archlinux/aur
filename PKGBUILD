# Maintainer: Haseeb Khalid <haseebkhalid1507@gmail.com>
pkgname=synaps
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal-native AI agent runtime built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/HaseebKhalid1507/SynapsCLI"
license=('Apache-2.0')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo' 'oniguruma')
# ring's C/asm objects are GCC-LTO-incompatible with rust-lld:
# makepkg's -flto=auto produces bitcode rust-lld can't read ->
# undefined ring_core_* symbols at link. Standard fix for
# ring-dependent Rust packages.
options=(!lto)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('05bd215bab75df132c77a79e6bda391592edde762e969ea1c7584c9c6f73ff10')

prepare() {
  cd "SynapsCLI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "SynapsCLI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "SynapsCLI-$pkgver"
  install -Dm755 "target/release/synaps" "$pkgdir/usr/bin/synaps"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
