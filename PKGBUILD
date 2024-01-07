# Maintainer: Madhur Ahuja <ahuja.madhur@gmail.com>
pkgname=csvlens
pkgver=0.5.1
pkgrel=1
pkgdesc='A command line CSV file viewer. It is like less but made for CSV.'
arch=('x86_64')
url='https://github.com/YS-L/csvlens'
license=('MIT')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "license.txt")
sha1sums=('33edc7d3b31e19c9e2ffca2d19a8c6e8c9429e20'
          '178e8165b4c57b6a2c126d3440209427264e6bcb')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm 644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd $pkgname-$pkgver
  install -Dm 755 target/release/csvlens "$pkgdir/usr/bin/csvlens"
  
}
