# Maintainer: Asger Geel Weirsoe <asger at weircon dot dk>
#
# ubl-tools: read UBL e-invoices (Peppol BIS 3.0, OIOUBL 2.1, EN 16931) offline,
# in the terminal or as a printable HTML page. Nothing is uploaded anywhere.
#
#   build recipe:  https://gitea.weircon.dk/agw/ubl-tools

pkgname=ubl-tools
pkgver=0.3.0
pkgrel=2
pkgdesc="Read UBL e-invoices (Peppol BIS 3.0, OIOUBL) offline, in the terminal or as a printable page"
arch=('x86_64')
url="https://asger.weirsøe.dk/en/projects/ubl-tools"
_repo="https://gitea.weircon.dk/agw/ubl-tools"
license=('MIT OR Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/v$pkgver.tar.gz")
sha256sums=('0ed5baba3e5e30fb934412d4da49e03a77d464127c67d3639990ac96568592f1')

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/ubl "$pkgdir/usr/bin/ubl"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
