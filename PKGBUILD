# Maintainer: yobson <aur@yobson.xyz>
pkgname=stremio-linux-shell
epoch=1
pkgver=1.3.0
pkgrel=3
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
sha256sums=('73a9b5b55127da7bc596d4882facde9ff9c3345a25ff67eb31370ab036af85c5'
            'ebaa519b944b4524284b252430dd822f579e0db5b0a52d1decd9c4b0788075b7')

prepare() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    # Allow the self-hosted UI selected by stremio.sh to use the streaming server.
    sed -i 's@^            process.env.NO_CORS ||@            req.headers.origin === "http://localhost:8080" || process.env.NO_CORS ||@' data/server.js
    if ! grep -Fq 'req.headers.origin === "http://localhost:8080" || process.env.NO_CORS ||' data/server.js; then
        error "Could not add the self-hosted stremio-web origin to the streaming server"
        return 1
    fi

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export GETTEXT_DIR=target/locale
    export STREMIO_LOCALEDIR=/usr/share/locale

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
    glib-compile-schemas --strict --targetdir="$pkgdir/usr/lib/stremio" "$pkgdir/usr/share/glib-2.0/schemas"
    install -Dm644 "data/icons/com.stremio.Stremio.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.Stremio.svg"
    install -Dm644 "target/locale/es/LC_MESSAGES/stremio.mo" "$pkgdir/usr/share/locale/es/LC_MESSAGES/stremio.mo"
    install -Dm644 "target/locale/fr/LC_MESSAGES/stremio.mo" "$pkgdir/usr/share/locale/fr/LC_MESSAGES/stremio.mo"

    sed -i '/^[[:space:]]*DBusActivatable[[:space:]]*=[[:space:]]*true[[:space:]]*$/d' \
        "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
}
