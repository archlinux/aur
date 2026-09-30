# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=bibavpn-desktop
pkgver=1.5.2
pkgrel=1
pkgdesc="BibaVPN desktop GUI (Tauri): DPI-resistant SOCKS5/HTTP tunnel over TLS+WebSocket"
arch=('x86_64')
url="https://github.com/Eljaja/BibaVPN"
license=('MIT')
# webkit2gtk-4.1 + gtk3 pull the rest of the GUI stack; libayatana-appindicator
# is dlopen'd at runtime for the system tray (tauri tray-icon feature).
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'gcc-libs')
# boring-tls (forced in tauri.conf) builds vendored BoringSSL: cmake compiles it,
# clang/libclang backs boring-sys' bindgen step.
makedepends=('cargo' 'npm' 'cmake' 'clang' 'git')
# ring/boring ship prebuilt asm/C objects that makepkg LTO turns into bitcode
# lld cannot resolve against the Rust crates -> undefined *_core_* symbols.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('4d390f053be1d98c0161e7f256680876f2042a79d7488c9f1d56e0fb98344ffe'
            '9206b96bb3ead05c48b6f28da7a4931f4a6a6b7f3cebd809006d5b6f4bd73171')

latestver() {
    git ls-remote --tags --refs "$url" |
        sed -nE 's@.*refs/tags/v([0-9]+(\.[0-9]+)*)$@\1@p' | sort -V | tail -1
}

prepare() {
    cd "BibaVPN-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    # @tauri-apps/cli (root) + vite/react (ui) are needed for the frontend build.
    npm ci --prefix apps/bibavpn-desktop
    npm ci --prefix apps/bibavpn-desktop/ui
}

build() {
    cd "BibaVPN-$pkgver/apps/bibavpn-desktop"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="$srcdir/BibaVPN-$pkgver/target"
    # makepkg injects -ffile-prefix-map only when debug is enabled; without it the
    # vendored BoringSSL (__FILE__) and rustc (panic locations) embed $srcdir.
    export CFLAGS+=" -ffile-prefix-map=$srcdir/=" CXXFLAGS+=" -ffile-prefix-map=$srcdir/="
    export RUSTFLAGS+=" --remap-path-prefix=$srcdir/="
    # --no-bundle: skip AppImage/deb packaging; we install the binary ourselves.
    npm exec -- tauri build --no-bundle
}

package() {
    cd "BibaVPN-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    local _icons=apps/bibavpn-desktop/src-tauri/icons
    install -Dm644 "$_icons/32x32.png"   "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 "$_icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 "$_icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
