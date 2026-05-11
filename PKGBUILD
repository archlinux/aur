# Maintainer: Matteo Giordano <mail at matteogiordano dot com>

pkgname=lla
pkgver=0.5.7
pkgrel=1
pkgdesc='A modern alternative to ls'
url='https://github.com/triyanox/lla'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=('!lto')
sha512sums=('d0ce660fa339658cc9201dd2f6bdef6b8fdc7dd33c37bbce064db794f6fb4b5414e55d71f28ce454a6c91bef9c991d3f2f2de3e572fa509ac5f05352e0c7e59e')

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
