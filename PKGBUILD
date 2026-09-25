# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rgd
pkgver=1.6.0
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
sha512sums=('03700a651dd2b5d604c5fd0eb45924ed8d56d02c0fa0a39d875e12add98b4e626cc5dfa2188168d543966e1f68bb4bc3bfeae3cad69763d25df3c84b76641903')
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
