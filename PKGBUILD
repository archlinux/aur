# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=leaves
pkgver=0.2.0
pkgrel=1
pkgdesc='A text-mode disk usage visualization utility.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/patonw/leaves'
license=('MPL-2.0')
makedepends=('cargo')
provides=('leaves')
conflicts=('leaves-git' 'leaves-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-cross.tar.gz")
sha256sums=('ffdfce45bc37b774ca183a36952f0cebad4e2dc1afc4188b663691493889c7bc')

prepare() {
    cd "${pkgname}-${pkgver}-cross"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}-cross"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}-cross"
    install -Dm0755 target/release/leaves "$pkgdir/usr/bin/leaves"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
