# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=v4l-tui
pkgver=0.1.1
pkgrel=1
pkgdesc='TUI alternative to v4l-ctl or cameractrls'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/sermuns/v4l-tui'
license=('GPL-3.0')
depends=('v4l-utils')
makedepends=(
    'cargo'
)
options=(
    !lto
    !debug
)
provides=('v4l-tui')
conflicts=('v4l-tui-git' 'v4l-tui-bin')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4514211b4d697f98d60084aadd66e2e3323f7bb5b93d66362586929c64086748')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 target/release/v4l-tui "$pkgdir/usr/bin/v4l-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
