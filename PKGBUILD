# Maintainer: Raul Dias <raul@dias.com.br>

pkgname=msi-gpu-mux-switch
pkgver=0.2.0
pkgrel=1
pkgdesc='Inspect and switch the GPU MUX mode on the MSI Vector 16 HX AI A2XWIG'
arch=(x86_64)
url='https://github.com/steelbrain/msi-gpu-mux-switch'
license=(MIT)
depends=(libgcc glibc)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('005d6155b36fea66c0c07304438c28df04f3aacfa00db06507a93cb27d65f5ef')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/msi-mux-switch -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
