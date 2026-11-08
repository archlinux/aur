# Maintainer: DonutsDelivery <admin@donutsdelivery.online>
pkgname=donutcleaner
pkgver=0.2.0
pkgrel=1
pkgdesc="System maintenance and package dependency manager for Linux, GTK4 and Rust (formerly SysClean)"
arch=('x86_64')
url="https://github.com/DonutsDelivery/Smart-Cleaner"
license=('MIT')
depends=('gtk4' 'libadwaita' 'polkit' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=('pacman-contrib: package cache cleanup with paccache')
provides=('donutcleaner')
conflicts=('donutcleaner-bin' 'sysclean')
replaces=('sysclean')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8589b6477ff2b85842eb67c8e41c0a95f2f2c1312a991b5bdd3638a94eb72250')

prepare() {
    cd "Smart-Cleaner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "Smart-Cleaner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "Smart-Cleaner-$pkgver"
    local appid=online.donutsdelivery.DonutCleaner
    local size
    install -Dm755 target/release/donutcleaner "$pkgdir/usr/bin/donutcleaner"
    install -Dm644 "data/$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
    install -Dm644 "data/$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
    install -Dm644 "icons/$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "icons/hicolor/${size}x${size}/apps/$appid.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$appid.png"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
