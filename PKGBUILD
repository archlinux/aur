# Maintainer: Eric Long <i@hack3r.moe>

pkgname=bpf-linker
pkgver=0.9.12
pkgrel=2
pkgdesc="Simple BPF static linker"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/aya-rs/$pkgname"
license=('Apache-2.0 OR MIT')
depends=('glibc' 'gcc-libs' 'llvm-libs')
makedepends=('cargo' 'llvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aya-rs/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('560c83026f630455217ec84f98bf65bc758169efb5816279f7cddfe81552c8db')

prepare() {
  cd "$pkgname-$pkgver"
  # https://github.com/time-rs/time/issues/681
  cargo update -p time --precise 0.3.36
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --no-default-features --features llvm-sys/force-dynamic
}

check() {
  cd "$pkgname-$pkgver"

  # skipping compile_test:
  # failed to build sysroot: "/usr/lib/rustlib/src/rust/library" does not seem to be a rust library
  # source folder: `src/Cargo.toml` not found
  CARGO_MANIFEST_DIR="$PWD" cargo test --frozen --no-default-features \
    --features llvm-sys/force-dynamic -- --skip compile_test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname"
}
