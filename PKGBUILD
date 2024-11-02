# Maintainer: Thomas Clarke <colonia_duck@posteo.net>
pkgname="elite-pip-macro"
pkgver=0.1.0
pkgrel=4
pkgdesc="Elite Dangerous Pip Macros for Linux X11 made with Rust"
arch=("x86_64")
url="https://github.com/CMDR-WDX/elite-pip-macro"
license=('MIT')
depends=('alsa-lib' 'pkgconf' 'libxtst')
makedepends=('cargo')
conflicts=('elite-pip-macro-bin')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/CMDR-WDX/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=("ab2d223c7efd6d1cc0884522e711e97e6f35579d3382e2fb0415018daa6e8712")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
