# Maintainer: Madhur Ahuja <ahuja.madhur@gmail.com>
pkgname=csvlens-git
pkgver=0.5.0.d023864
pkgrel=1
pkgdesc='csvlens is a command line CSV file viewer. It is like less but made for CSV.'
arch=('x86_64')
url='https://github.com/YS-L/csvlens'
license=('MIT')
makedepends=('cargo')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha1sums=('SKIP')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/csvlens "$pkgdir/usr/bin/csvlens"

}
