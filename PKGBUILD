# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wtfi2-git
_pkgname=wtfi2
pkgver=0.6.0.r4.g76f245e
pkgrel=1
pkgdesc='Live, visual network-path diagnostic that pinpoints exactly where your Wi-Fi connection dies'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/kanywst/wtfi2'
license=('MIT')
makedepends=(
    'cargo'
    'git'
)
options=(
    '!lto'
    '!debug'
)
provides=('wtfi')
conflicts=('wtfi2' 'wtfi2-bin')
source=("${_pkgname}-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm0755 target/release/wtfi "$pkgdir/usr/bin/wtfi"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
