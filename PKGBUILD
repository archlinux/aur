# Maintainer: yobson <contact@yobson.xyz>
pkgname=stremio-linux-shell
pkgver=1.0.0_beta.13
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
    'libepoxy'
    'openssl'
    'gettext'
    'hicolor-icon-theme'
)
makedepends=(
    'cargo'
    'pkgconf'
    'cmake'
    'binutils'
    'licenses'
    'nodejs'
    'gtk4'
    'libadwaita'
    'webkitgtk-6.0'
    'mpv'
    'libepoxy'
    'gettext'
    'clang'
    'patchelf'
)
provides=('stremio')
conflicts=('stremio' 'stremio-git' 'stremio-linux-shell-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('16a8d1a66516979566136172de12807f59d7ef33d5b807ae7905492c48de4386')
options=(!lto)

prepare() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    export CC=clang
    export CXX=clang++
    export CEF_PATH="$srcdir/cef"
    export RUSTFLAGS="$RUSTFLAGS -L native=$CEF_PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CEF_PATH"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

package() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    install -Dm755 "target/release/stremio-linux-shell" "$pkgdir/usr/share/stremio/stremio"
    install -Dm755 "data/server.js" "$pkgdir/usr/share/stremio/server.js"

    install -d "$pkgdir/usr/share/stremio/cef"
    cp -r "$srcdir/cef"/* "$pkgdir/usr/share/stremio/cef/"
    rmdir "$pkgdir/usr/share/stremio/cef/locales/locales"

    patchelf --set-rpath '$ORIGIN/cef' "$pkgdir/usr/share/stremio/stremio"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/share/stremio/stremio" "$pkgdir/usr/bin/stremio"

    install -Dm644 "data/com.stremio.Stremio.desktop" "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
    install -Dm644 "data/icons/com.stremio.Stremio.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.Stremio.svg"
    install -Dm644 "data/com.stremio.Stremio.metainfo.xml" "$pkgdir/usr/share/metainfo/com.stremio.Stremio.metainfo.xml"
}
