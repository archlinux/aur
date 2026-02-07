# Maintainer: FrogSnot
pkgname=hardbore
pkgver=1.1.4
pkgrel=1
pkgdesc="High-performance file manager for Linux"
arch=('x86_64')
url="https://github.com/FrogSnot/HardBore"
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'sqlite' 'dbus')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0623895ca682af148cb1511db7a72930de6d99da9bb5fc67d5114b3b761a015b')

build() {
    cd "$srcdir/HardBore-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    # Arch's rust defaults to lld which mishandles bundled SQLite static linking
    export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-fuse-ld=bfd"
    npm install
    npx tauri build --no-bundle
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
