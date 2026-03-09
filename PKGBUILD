# Maintainer: Kamil <kamil@kamil.dev>

pkgname=work-tuimer
pkgver=0.5.3
pkgrel=1
pkgdesc='Simple, keyboard-driven TUI for time-tracking'
url='https://github.com/Kamyil/work-tuimer'
license=('MIT')
makedepends=('cargo' 'rust')
depends=('gcc-libs' 'glibc')
options=('!lto')
arch=('x86_64' 'aarch64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kamyil/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('SKIP')  # Will be filled after first test build

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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
