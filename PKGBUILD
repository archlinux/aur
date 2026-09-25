# Maintainer: Your Name <saylesss87@proton.me at domain dot tld>
pkgname=jj-release
pkgver=0.8.0
pkgrel=1
pkgdesc='Semantic releases and changelog generation for jj-vcs repositories'
url='https://github.com/saylesss88/jj-release'
license=('Apache-2.0')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
arch=('x86_64')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('6b0e74bf3a6f4a3c91d8222f28c8c9ac2a8bfd1361cbcc6c2307283a75440e161e6ba2af81fc584a0e0f7559a0fc0f41c35edaca01bd5443a21244189c1ba345')

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

