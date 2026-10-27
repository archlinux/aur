# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=therapist-git
_pkgname=therapist
pkgver=0.1.1.r1.g32d1d06
pkgrel=1
pkgdesc='A blazingly fast terminal log viewer: open multi-GB logs at once.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/M-Komorek/therapist'
license=('MIT')
makedepends=(
    'cargo'
    'git'
)
options=(
    '!lto'
    '!debug'
)
provides=('thr')
conflicts=('therapist')
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
    install -Dm0755 target/release/thr "$pkgdir/usr/bin/thr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
