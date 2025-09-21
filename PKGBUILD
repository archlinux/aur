# Maintainer: realdanvanth <realdanvanth@gmail.com>
pkgname=realvim
pkgver=1.0
pkgrel=2
pkgdesc="A lightweight terminal text editor written in rust"
arch=('x86_64')
url="https://github.com/realdanvanth/realvim"
license=('custom')
depends=('gcc-libs' 'oniguruma')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/realdanvanth/realvim/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ONIG_SYS_STATIC=false
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo build --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
