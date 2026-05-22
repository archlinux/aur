# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=splashboard
pkgver=2.6.0
pkgrel=1
pkgdesc='A customizable terminal splash screen with plugin-based data sources'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/unhappychoice/splashboard'
license=('ISC')
depends=(
    'gcc-libs'
    'glibc'
    'zlib'
    'git'
)
makedepends=('cargo')
options=(!lto !debug)
provides=('splashboard')
conflicts=('splashboard-git' 'splashboard-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23e71af3635815860228ef8b2e65f9088578fff360e22ef8f1afd50a19443e0e')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/splashboard "$pkgdir/usr/bin/splashboard"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
