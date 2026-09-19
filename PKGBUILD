# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>
pkgname=clockode
pkgver=0.2.9
pkgrel=1
pkgdesc="TOTP client made with Iced"
arch=('x86_64' 'aarch64')
url="https://github.com/mariinkys/clockode"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
conflicts=()
b2sums=('7686fed207528573a7d096a0545ac57ceb3f6511317da3caa611485cdb842623ed35b4c50d51339fc588e3ce4accc96624ba8957d6238435821d689dddb9917e')

cargo_do() {
    RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo "$@"
}

prepare() {
    cd "$pkgname-$pkgver"
    cargo_do fetch --locked --target "$(rustc --print host-tuple)"
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
