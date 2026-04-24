pkgbase=lyrica
pkgname=(lyrica plasma-applet-lyrica obs-plugin-lyrica)
pkgver=0.23
pkgrel=1
pkgdesc="Linux desktop lyrics widget focused on simplicity and integration."
arch=("x86_64")
url="https://github.com/chiyuki0325/lyrica/"
license=("MIT")
makedepends=("cargo" "jq")
options=("!lto") # Undefined references to ...
source=("$pkgname-$pkgver.tar.gz::https://github.com/chiyuki0325/lyrica/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a51d789ec90f5aa1f517a8b74ab14bdf00a342e7d0897df026a6ff50f2d7193b')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple    
}

build() {
    cd "$srcdir/$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=true
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package_lyrica() {
    depends=(zlib libgcc glibc openssl zstd)

    cd "$srcdir/$pkgbase-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/LYRIC_PROVIDERS*.md
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_plasma-applet-lyrica() {
    pkgdesc+=" (Plasma6 applet frontend)"
    depends=("lyrica=$pkgver" qt6-declarative qt6-websockets libplasma kirigami
             plasma5support psmisc bash)
    arch=(any)
    cd "$srcdir/$pkgbase-$pkgver"
    local plasmoids="$pkgdir/usr/share/plasma/plasmoids"
    local id
    id="$(jq -r .KPlugin.Id frontend/kde/metadata.json)"
    mkdir -p "$plasmoids/$id/contents/bin"
    cp -a --no-preserve=ownership frontend/kde/. "$plasmoids/$id"
    rm -rf "$plasmoids/$id/translate"
    ln -srfv "$pkgdir/usr/lib/lyrica/lyrica" "$plasmoids/$id/contents/bin/lyrica"
    sed -i "s|\$HOME/.local|/usr|" "$plasmoids/$id/contents/ui/main.qml"
    sed -i "s|LYRICA_VERSION|$pkgver|g" "$plasmoids/$id/metadata.json"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_obs-plugin-lyrica() {
    pkgdesc+=" (frontend script for OBS Studio)"
    depends=("lyrica=$pkgver" python-websockets obs-studio)
    arch=(any)
    cd "$srcdir/$pkgbase-$pkgver"
    local scripts="$pkgdir/usr/share/obs/obs-plugins/frontend-tools/scripts"
    install -Dm644 frontend/obs_studio/lyrica_obs_plugin.py "$scripts/lyrica_obs_plugin.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
