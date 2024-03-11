# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=netscanner
pkgver=0.4.0
pkgrel=2
pkgdesc="Network scanner"
arch=('x86_64')
url="https://github.com/Chleba/netscanner"
license=('GPL3')
depends=('gcc-libs' 'iw')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "Cargo.lock")
sha512sums=('e952538da7a875ab8e6de87cfbe4126f77c682eb807393d0d0807dbd0a9c54abf4bef5e5cc43e7e3d8606a909adb3b97178198037be6c940c84fa3d68949c053'
            '003b9af495dc1f4c7a036088a38e7dc52772c9fc4f8c4f6a309e18e07826f3b052667936ac691573f47088b908fcec9a56de51c3a2b512dee35654c9cd3abdd7')

prepare() {
  cp Cargo.lock "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
