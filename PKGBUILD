# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wtfi2-git
_pkgname=wtfi2
pkgver=0.10.0.r0.gf906223
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
install=wtfi2.install
source=(
    "${_pkgname}-main::git+$url.git#branch=main"
    '0001-fix-service-use-the-global-path.patch'
    'wtfi2.install'
)
sha256sums=(
    'SKIP'
    '67ddc4dec7cea34b8d4e8876c16b7cde34f09e1b5ec94a1329defecd36636261'
    'fca82538ba506d7d4c01d3e587a68a6cea767bdf9ab444eccf969ef8684d1b1e'
)

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "${_pkgname}-main"
    patch -p1 < ../0001-fix-service-use-the-global-path.patch
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
