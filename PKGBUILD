# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=proxelar
pkgver=0.5.1
pkgrel=1
pkgdesc='Programmable MITM proxy that intercepts HTTP/HTTPS traffic. With a TUI, terminal, and web GUI interface'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/emanuele-em/proxelar'
license=('MIT')
depends=('lua')
makedepends=('cargo')
options=(
    '!lto'
    '!debug'
)
provides=('proxelar')
conflicts=('proxelar-git' 'proxelar-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4f67a2248a87101c4e4d28180b7d707f12cad90070d9687ad2411e7f25e32d9')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/proxelar "$pkgdir/usr/bin/proxelar"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
