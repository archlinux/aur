# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=bibavpn-desktop
pkgver=1.3.0
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
sha256sums=('b7a8bfef80f1ff73697cceb97c533f9da50e40fab46eb51d310f1673259df1e9'
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
    # Note: under a !debug makepkg.conf, makepkg injects no -ffile-prefix-map, so
    # vendored BoringSSL bakes $srcdir into __FILE__ strings in its FIPS .rodata
    # (cosmetic "reference to $srcdir" warning; RPATH/functional paths stay clean).
    # The standard devtools/debug build remaps these to /usr/src/debug, so no fix
    # is forced here.
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
