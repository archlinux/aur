# Maintainer: yobson <aur@yobson.xyz>
pkgname=stremio-linux-shell
epoch=1
pkgver=1.2.0
pkgrel=1
pkgdesc="A native Linux client for Stremio"
arch=('x86_64')
url="https://github.com/Stremio/$pkgname"
license=('GPL-3.0-only')
depends=(
    'gtk4'
    'libadwaita'
    'webkitgtk-6.0'
    'mpv'
    'openssl'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'nodejs'
    'mesa-utils'
)
makedepends=('cargo')
optdepends=(
    'xdg-desktop-portal-impl: enabling background mode & opening URLs'
    'stremio-web: use locally self-hosted web client instead of the default web.stremio.com'
)
provides=('stremio')
conflicts=('stremio')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    'stremio.sh')
sha256sums=('aff0e1486aabccb25d4165792b3ce6dcb741bc4b50af4601f66ac3d41fb70670'
            '2c92d0aa1d3d7297585e71ce49f92573682d9335190072df3d69d62777633434')

prepare() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    install -Dm755 "$srcdir/stremio.sh" "$pkgdir/usr/bin/stremio"
    install -Dm755 "target/release/stremio-linux-shell" "$pkgdir/usr/lib/stremio/stremio"
    install -Dm644 "data/server.js" "$pkgdir/usr/share/stremio/server.js"

    install -Dm644 "data/com.stremio.Stremio.desktop" "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
    install -Dm644 "data/com.stremio.Stremio.metainfo.xml" "$pkgdir/usr/share/metainfo/com.stremio.Stremio.metainfo.xml"
    install -Dm644 "data/com.stremio.Stremio.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/com.stremio.Stremio.gschema.xml"
    install -Dm644 "data/icons/com.stremio.Stremio.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.Stremio.svg"
    install -Dm644 "po/es/LC_MESSAGES/stremio.mo" "$pkgdir/usr/share/locale/es/LC_MESSAGES/stremio.mo"
    install -Dm644 "po/fr/LC_MESSAGES/stremio.mo" "$pkgdir/usr/share/locale/fr/LC_MESSAGES/stremio.mo"

    sed -i '/^[[:space:]]*DBusActivatable[[:space:]]*=[[:space:]]*true[[:space:]]*$/d' \
        "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
}
