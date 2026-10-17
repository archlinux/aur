# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>
pkgname=clockode
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple TOTP client (2FA codes) with KeePass storage"
arch=('x86_64' 'aarch64')
url="https://github.com/mariinkys/clockode"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
conflicts=()
b2sums=('1bfce0ecdb0fd494cedd8d242bac1dfe2f3f003a59dafc73274d0fdf9e8d650404dbeb74352433db02b4f3fe3d189ecd1efc938ed871ad303c434e00cdb3a809')

cargo_do() {
    RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo "$@"
}

prepare() {
    cd "$pkgname-$pkgver"
    cargo_do fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver"
    # Use the "flatpak-camera" feature to avoid the AUR dependency on mozjpeg which doesn't currently build
    cargo_do build --frozen --release --features flatpak-camera
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
