# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>
pkgname=clockode
pkgver=0.2.7
pkgrel=1
pkgdesc="TOTP client made with Iced"
arch=('x86_64' 'aarch64')
url="https://github.com/mariinkys/clockode"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
conflicts=()
b2sums=('f54b3ecc95970b9ca4a46feefed842c24fb0ab9f6a2211ca05cd7b15fc8970f2640665c517e0028ecbe30c750cac1f3f669e4950c7bc242a205aa72aa7b5e81c')

cargo_do() {
    RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo "$@"
}

prepare() {
    cd "$pkgname-$pkgver"
    cargo_do fetch --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver"
    cargo_do build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    local appid="dev.mariinkys.Clockode"
    install -Dm755 "target/release/clockode" -t "$pkgdir/usr/bin/"
    install -Dm644 "resources/$appid.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "resources/$appid.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
    install -Dm644 "resources/icons/hicolor/scalable/apps/icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm644 "resources/icons/hicolor/256x256/apps/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$appid.png"
}
