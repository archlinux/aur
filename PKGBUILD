# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=livediff-git
_pkgname=livediff
pkgver=0.3.0.r10.g9ff519d
pkgrel=1
pkgdesc='Real-time file monitoring with beautiful, pulsing TUI diff visualization'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/SoCkEt7/Livediff'
license=(
    'MIT'
    'Apache-2.0'
)
makedepends=(
    'cargo'
    'git'
)
options=(
    !lto
    !debug
    !strip
)
provides=('livediff')
conflicts=('livediff' 'livediff-bin')
source=("${_pkgname}-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm0755 target/release/livediff "$pkgdir/usr/bin/livediff"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
