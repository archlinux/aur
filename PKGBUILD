# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

pkgname=esp-config
pkgver=0.6.1
pkgrel=1
pkgdesc='Configure projects using esp-hal and related packages'
url='https://github.com/esp-rs/esp-hal/tree/main/esp-config'
license=('MIT' 'Apache-2.0')
makedepends=('cargo')
depends=('libgcc' 'glibc')
options=(!lto)
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "LICENSE-MIT"
        "LICENSE-APACHE")
sha256sums=('102871054f8dd98202177b9890cb4b71d0c6fe1f1413b7a379a8e0841fc2473c'
            '7b2165c6740592038d887d51d56d122b0b563337a7756b424f19eecc7a936ef1'
            '2bf4fe1a37e545c3b4f7bfaa2326c99f153af32ef8d112fbaa4bff7fb2a575bd')

prepare() {
    cd "$pkgname-$pkgver" 
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver" 
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver" 
    install -Dm 755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../LICENSE-* 
}
