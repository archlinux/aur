# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=chopper
pkgver=0.12.0
pkgrel=1
pkgdesc='Rust implementation of NanoFilt+NanoLyse intended for long read sequencing'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('git' 'rust' 'cmake')
url='https://github.com/wdecoster/chopper'
license=('MIT')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/chopper/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('d9b2655bce55a6d673b1e1937a4c1608627321ef54c76481d0bcf9fa218d5f95ef1ccb631369a22934780f486214dfa37da06612c1ef531012ddd8e17b90050d')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch  --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

