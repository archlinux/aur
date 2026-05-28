# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tuxedo-git
_pkgname=tuxedo
pkgver=2026.5.12.r1.gc043636
pkgrel=1
pkgdesc='A fast, keyboard-driven terminal UI for todo.txt.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/webstonehq/tuxedo'
license=('MIT')
depends=(
    'glibc'
    'libgcc'
)
makedepends=(
    'cargo'
    'git'
)
options=(!strip)
provides=('tuxedo')
conflicts=('tuxedo' 'tuxedo-bin')
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
    install -Dm0755 target/release/tuxedo "$pkgdir/usr/bin/tuxedo"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
