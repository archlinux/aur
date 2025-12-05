pkgname=rusty-pipes
pkgver=1.0.4
pkgrel=1
pkgdesc="A MIDI-controlled virtual pipe organ simulator compatible with GrandOrgue and Hauptwerk sample sets."
arch=('x86_64')
url="https://github.com/dividebysandwich/rusty-pipes"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'jack' 'libx11' 'libxkbcommon' 'wayland' 'mesa' 'desktop-file-utils')
makedepends=('rust' 'cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/rusty-pipes/archive/refs/tags/v$pkgver.tar.gz"
    "rusty-pipes-$pkgver.desktop::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes.desktop"
    "rusty-pipes-text-$pkgver.desktop::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes-text.desktop"
    "rusty-pipes-$pkgver.png::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes.png"
)
sha256sums=('1e6c315e173bc22cd965d5c029a696e05a4dce85c8ec8b7a9781c4bf728df9f0'
            'cd1eafd36d3185bed9dfe4a83f1c9b94575fa56c0ebc3a878fd9b8b6c7820341'
            'b54f72270c8bcd5557b1724dd2875ebc89bef247caffa2b75b7985f4d8f463ac'
            'bc867e93be2660685875873d33991ab343860b311cbf06cde753007e1d6a6990')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "rusty-pipes-$pkgver"
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "rusty-pipes-$pkgver"
    # --locked ensures we use the versions from Cargo.lock for a reproducible build
    cargo build --frozen --release
}

package() {
    cd "rusty-pipes-$pkgver"

    # Install the main binary
    install -Dm755 "target/release/rusty-pipes" "$pkgdir/usr/bin/rusty-pipes"

    # Install the license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install the desktop file (for the menu)
    install -Dm644 "$srcdir/rusty-pipes-$pkgver.desktop" "$pkgdir/usr/share/applications/rusty-pipes.desktop"
    install -Dm644 "$srcdir/rusty-pipes-text-$pkgver.desktop" "$pkgdir/usr/share/applications/rusty-pipes-text.desktop"
    
    # Install the icon
    install -Dm644 "$srcdir/rusty-pipes-$pkgver.png" "$pkgdir/usr/share/pixmaps/rusty-pipes.png"

}
