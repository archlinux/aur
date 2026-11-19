# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker
pkgver=1.8.1
pkgrel=1
pkgdesc='Simple TUI budget tracker. Designed to track income and expenses and help visualize and gather basic insights from your transactions.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/Feromond/budget-tracker-tui'
license=('GPL-3.0')
makedepends=(
    'cargo'
    'patch'
)
options=(
    !lto 
    !debug
)
provides=('budget-tracker')
conflicts=('budget-tracker-git' 'budget-tracker-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    '0001-clean-remove-the-auto-update-functionallty.patch'
)
sha256sums=(
    '94df80a938e4e9365956dcaabe85c6bb62e6aed8f5133a5c8c01ceb06a12371d'
    '23718f6d0508530f0836740fdb863c9e4497e84fffd95296a9a419f741c1ed5b'
)

prepare() {
    cd "budget-tracker-tui-$pkgver"
    patch -p1 < ../0001-clean-remove-the-auto-update-functionallty.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "budget-tracker-tui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "budget-tracker-tui-$pkgver"
    install -Dm0755 target/release/budget-tracker "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
