# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: qubidt <qubidt at gmail dot com>
pkgname=sniffnet
pkgver=1.1.2
pkgrel=3
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
sha512sums=('e215fd29b50e1d1b42c659c8d896f1704c7dd2c0a5624c33cb394eaf93bcaca634b27bfc3f9928fd04fa8951b1254fafb70b11ab5f0890b476f97c9acf749039'
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
