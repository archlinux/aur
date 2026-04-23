# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tuicr-git
_pkgname=tuicr
pkgver=0.10.0.r5.g206eb96
pkgrel=1
pkgdesc='a terminal UI for local code review'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/agavra/tuicr'
license=('MIT')
makedepends=('cargo' 'git')
options=(!lto)
provides=('tuicr')
conflicts=('tuicr' 'tuicr-bin')
source=("$_pkgname-main::git+$url.git#branch=main")
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
    install -Dm0755 target/release/tuicr "$pkgdir/usr/bin/tuicr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
