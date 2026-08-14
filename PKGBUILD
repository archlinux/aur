# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rgd
pkgver=1.4.0
pkgrel=1
pkgdesc="Installed game detection utility for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/rolv-apneseth/rgd"
license=('AGPL3')
depends=(
    gcc-libs # libgcc_s.so.1
    glibc    # libc.so.6 libm.so.6
    sqlite   # libsqlite3.so.0
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('af125fbdf1c3960e748e9d084c5abd7ecccf5b5ab2f23df4354269af2913db2a94f6bda21e968af3a6a2794b7c4a9a6c19ab06ff08494defb7169c61d7269004')
options=(!debug !lto)

prepare() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
