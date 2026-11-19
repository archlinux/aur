# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker-git
_pkgname=budget-tracker
pkgver=1.8.1.r2.ge72e709
pkgrel=1
pkgdesc='A simple TUI budget tracker. Designed to track income and expenses and help visualize and gather basic insights from your transactions.'
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
conflicts=('budget-tracker' 'budget-tracker-bin')
source=(
    "$_pkgname-main::git+$url.git#branch=main"
    '0001-clean-remove-the-auto-update-functionallty.patch'
)
sha256sums=(
    'SKIP'
    '23718f6d0508530f0836740fdb863c9e4497e84fffd95296a9a419f741c1ed5b'
)

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    patch -p1 < ../0001-clean-remove-the-auto-update-functionallty.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/budget-tracker "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
