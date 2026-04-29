# Maintainer: yobson <aur@yobson.xyz>
pkgname=stremio-linux-shell
pkgver=1.0.0_beta.13
pkgrel=1
_cef_version=138.0.21
_cef_full_name=cef_binary_138.0.21+g54811fe+chromium-138.0.7204.101_linux64_minimal.tar.bz2
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
)
makedepends=(
    'cargo'
    'clang'
    'patchelf'
)
provides=('stremio')
conflicts=('stremio' 'stremio-git' 'stremio-linux-shell-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "cef-${_cef_version}.tar.bz2::https://cef-builds.spotifycdn.com/${_cef_full_name}")
sha256sums=('16a8d1a66516979566136172de12807f59d7ef33d5b807ae7905492c48de4386'
    '2a86ffe653dd65cf4920fc73aa225735231ac4bb80bcd40a75dfc0643897bcd2')
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
    export CEF_PATH="$srcdir/${_cef_full_name%.tar.bz2}/Release"
    export RUSTFLAGS="$RUSTFLAGS -L native=$CEF_PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CEF_PATH"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # --all-features includes `offline-build` in this case
    # so we don't download cef in build.rs
    cargo build --release --frozen --all-features
}

package() {
    cd "$srcdir/${_cef_full_name%.tar.bz2}"

    install -Dm644 Resources/locales/** -t "$pkgdir/usr/share/stremio/cef/locales/"
    install -Dm644 Resources/*.pak -t "$pkgdir/usr/share/stremio/cef/"
    install -Dm644 Resources/icudtl.dat -t "$pkgdir/usr/share/stremio/cef/"

    install -Dm755 Release/*.so -t "$pkgdir/usr/share/stremio/cef/"
    install -Dm644 Release/v8_context_snapshot.bin -t "$pkgdir/usr/share/stremio/cef/"

    cd "$srcdir/$pkgname-${pkgver//_/-}"

    install -Dm755 "target/release/stremio-linux-shell" "$pkgdir/usr/share/stremio/stremio"
    install -Dm755 "data/server.js" "$pkgdir/usr/share/stremio/server.js"

    patchelf --set-rpath '$ORIGIN/cef' "$pkgdir/usr/share/stremio/stremio"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/share/stremio/stremio" "$pkgdir/usr/bin/stremio"

    install -Dm644 "data/com.stremio.Stremio.desktop" "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
    install -Dm644 "data/icons/com.stremio.Stremio.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.Stremio.svg"
    install -Dm644 "data/com.stremio.Stremio.metainfo.xml" "$pkgdir/usr/share/metainfo/com.stremio.Stremio.metainfo.xml"
}
