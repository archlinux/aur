# Maintainer: Kamil Ksen <kamyilksen@gmail.com>

pkgname=work-tuimer
pkgver=0.3.1
pkgrel=1
pkgdesc='Simple, keyboard-driven TUI for time-tracking'
url='https://github.com/Kamyil/work-tuimer'
license=('MIT')
makedepends=('cargo' 'rust')
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kamyil/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('119997875229341be2551a58be15a7c68c45f4400be833a5a021ec1589c916a2877cad76345c240474cb68d241f86ae33d5a33cee6fad9dc1102e0490c83648c')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
