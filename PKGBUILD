# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=v4l-tui-git
_pkgname=v4l-tui
pkgver=r58.2b0291d
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
    'git'
)
options=(
    !lto
    !debug
)
provides=('v4l-tui')
conflicts=('v4l-tui' 'v4l-tui-bin')
source=("${_pkgname}-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_pkgname}-main"
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
    install -Dm0755 target/release/v4l-tui "$pkgdir/usr/bin/v4l-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
