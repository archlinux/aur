# Maintainer: Oskar Gerlicz-Kowalczuk <oskar@gerlicz.space>

pkgname=andron
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultra-lightweight Android compatibility & translation runtime for Linux"
arch=('x86_64')
url="https://github.com/gerliczkowalczuk/andron"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'wayland: native Wayland zero-copy display support'
  'pipewire: low-latency direct audio routing'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gerliczkowalczuk/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40c8d4f3252c7bc511a4a7f359251c8c80d6c7f8abf3e8b7f7b0e96171c4c81c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-targets
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
