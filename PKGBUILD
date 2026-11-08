# Maintainer: Your Name <saylesss87@proton.me at domain dot tld>
pkgname=jj-release
pkgver=0.11.0
pkgrel=1
pkgdesc='Semantic releases and changelog generation for jj-vcs repositories'
url='https://github.com/saylesss88/jj-release'
license=('Apache-2.0')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
arch=('x86_64')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('143c237514bff420dcfa6d8540b74a95aa467fe4fee6bd604ab5053ef978bca8f645eec2d7610e44bdee3081301eb18d1acef446ed3f7f00573c96463209f8e9')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  echo "[workspace]" >> Cargo.toml
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

