# Maintainer: FrogSnot
pkgname=hardbore
pkgver=1.2.5
pkgrel=1
pkgdesc="High-performance file manager for Linux"
arch=('x86_64')
url="https://github.com/FrogSnot/HardBore"
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'sqlite' 'dbus')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d01600931df0e0ac54fa758bc63f7f25b80c8a896318fbd3a26d501fb9b744b')

build() {
    cd "$srcdir/HardBore-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    npm install
    npx tauri build --no-bundle -- --no-default-features
    cd portal
    cargo build --release
}

package() {
    cd "$srcdir/HardBore-$pkgver"

    install -Dm755 "src-tauri/target/release/hardbore" "$pkgdir/usr/bin/hardbore"
    install -Dm755 "portal/target/release/portal" "$pkgdir/usr/local/bin/hardbore-portal"

    install -Dm644 "hardbore.desktop" "$pkgdir/usr/share/applications/hardbore.desktop"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/hardbore.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "portal/hardbore.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/hardbore.portal"
    install -Dm644 "portal/org.freedesktop.impl.portal.desktop.hardbore.service" \
        "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.hardbore.service"
}
