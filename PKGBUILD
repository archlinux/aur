# Maintainer: Matteo Giordano <mail at matteogiordano dot com>

pkgname=lla
pkgver=0.5.4
pkgrel=1
pkgdesc='A modern alternative to ls'
url='https://github.com/triyanox/lla'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=('!lto')
sha512sums=('2a851ef55bfb9fac48234fd9fb4bd00e95f064cdc0f9710ba3b3661f8d368dcf470836d71bb2d60843c90eefeddb2b5145b568521901a88d835ed53c10b143d3')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTONIG_SYSTEM_LIBONIG=1
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
