# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr
pkgver=0.13.1
pkgrel=1
pkgdesc="Wayland screenshot, annotation and screen recording tool with ShareX-compatible uploads"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
conflicts=("$pkgname-bin")
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-plugin-rav1e' 'gst-plugin-pipewire')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ab827a2b7fbb3789b7828e074d9f28cba1d33272b16dc4fa69aa9be812cadb0')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/framr" "$pkgdir/usr/bin/framr"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
