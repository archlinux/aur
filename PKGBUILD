# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar
_pkgname=guitar
pkgver=0.1.33
pkgrel=1
pkgdesc="A terminal based git client with fast topological & chronological graph rendering"
arch=(x86_64 aarch64)
url="https://github.com/asinglebit/guitar"
license=('GPL-3.1')
depends=(git)
makedepends=(cargo)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=(guitar)
sha256sums=('6fb88f6fd874e17f94a7323406826e93ada22e6f4dec3b73ef514d7a5c95e229')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # fix the naitive linking errors 
  export RUSTFLAGS="-Clinker-plugin-lto"
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

