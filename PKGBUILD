# Maintainer: Matteo Giordano <mail at matteogiordano dot com>

pkgname=lla
pkgver=0.5.12
pkgrel=1
pkgdesc='A modern alternative to ls'
url='https://github.com/triyanox/lla'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=('!lto')
sha512sums=('c3a143997ec35adc0793228e58b7313e96548ba8080c59264f43dff83f86c262f6196a5352134149579d1a2dfc13364864fc8ccbbb49715d94fda4ff08fb51f6')

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
