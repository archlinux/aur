pkgname=weathr
_build_hash=43637d5adabf0a363a59f1d4b0d9a3938d8eee08
pkgver=1.4.0
pkgrel=1
pkgdesc="a terminal weather app with ascii animation"
arch=(x86_64)
url="https://github.com/Veirt/weathr"
license=(GPL-3.0-or-later)
depends=(
glibc
libgcc
)
makedepends=(
git
cargo
)

options=('!lto')

source=("git+https://github.com/Veirt/weathr#commit=${_build_hash}")

sha512sums=('4986b601ca797f9f3ecda1a47eab357cf737a08d46f1eb848b0a072a07e1a68ef04d8b0b9baa539c455cdd0456a1cb9598a9301c0d72498cd8e73c156ff8e65f')

pkgver() {
  cd weathr
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd weathr
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd weathr
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd weathr
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd weathr
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

