# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: qubidt <qubidt at gmail dot com>
pkgname=sniffnet
pkgver=1.1.4
pkgrel=1
pkgdesc="Application to comfortably monitor your network traffic"
arch=('x86_64')
url="https://github.com/GyulyVGC/$pkgname"
license=('Apache' 'MIT')
depends=('alsa-lib' 'fontconfig' 'libpcap' 'freetype2' 'glibc')
makedepends=('cargo')
options=('!lto')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "${pkgname}.desktop")
sha512sums=('a60f2024972f6882f3a820b6d9b0d1b8f441ded087b79889e995bc264c3adf0e50df15fb4bf0e41a3caa0d11ab694c5c5be613821f9da501cdb899de15ab7d60'
            '39d23f967ac05579d9bb87f2c5fcf961f760b0cfab1138253bcc8b22fd9964e27bc9ec6c42e8ed49a287ec5443bf352baf8dd4b4d063c2f6aa29c714d38da2a3')

prepare() {
    cd "$pkgname-$pkgver"
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
    install -Dm644 -t "${pkgdir}"/usr/share/applications "${pkgname}.desktop"
    install -Dm644 "${pkgname}-${pkgver}/resources/logos/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
