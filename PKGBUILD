pkgname=fyrox-project-manager
pkgver=0.36.2
pkgrel=2
pkgdesc="3D and 2D game engine written in Rust"
arch=('x86_64')
url="fyrox.rs"
license=('MIT')
depends=('gcc-libs'
         'glibc'
         'libxcb'
         'alsa-lib'
         'mesa')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('ea4d0d99f454656b8f497c78a582b1502751d7e959041f3038af9aca4631dde5892b4b085a7d6ea4b48e62808ccb249ae9fdd95242e77cac4b933a4476e03bf6')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
