# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=seetui
pkgver=0.1.5
pkgrel=1
pkgdesc='see (Service Event Extraction) is a TUI based tool to lookup logs from services (systemd)'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/NustyFrozen/SEE'
license=('GPL-3.0')
makedepends=('cargo')
provides=('seetui')
conflicts=('seetui-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    'Cargo.lock')
sha256sums=('be9caaa085548a1d863766cd448f28cb8ad3d2b2d35a1bd57b0a6d681a7fdbae'
            'fa822d7c5efe12d6f9ed191c24d999bb521a8c37cd47cefcf4137a23e8caa418')

prepare() {
    cd "SEE-$pkgver/"
    mv ../Cargo.lock .
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "SEE-$pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "SEE-$pkgver/"
    install -Dm0755 'target/release/seetui' "$pkgdir/usr/bin/seetui"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
