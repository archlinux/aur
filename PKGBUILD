# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker
pkgver=1.6.1
pkgrel=1
pkgdesc='Simple TUI budget tracker. Designed to track income and expenses and help visualize and gather basic insights from your transactions.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/Feromond/budget_tracker_tui'
license=('GPL-3.0')
makedepends=('cargo')
options=(
    !lto 
    !debug
)
provides=('budget-tracker')
conflicts=('budget-tracker-git' 'budget-tracker-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a32fc7263d470b6a8d6d7f178a818aa3b46fdb1eef35268cb3c46c8223efc427')

prepare() {
    cd "budget-tracker-tui-$pkgver"
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
