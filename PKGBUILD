# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=giff-git
_pkgname=giff
pkgver=1.2.0.r3.ga5dd673
pkgrel=1
pkgdesc='A terminal-based Git diff viewer with interactive rebase capabilities'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/bahdotsh/giff'
license=('MIT')
makedepends=('cargo' 'git')
provides=('giff')
conflicts=('giff' 'giff-bin')
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
    install -Dm0755 target/release/giff "$pkgdir/usr/bin/giff"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
