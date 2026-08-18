# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=open-orpheus
pkgver=0.16.2
pkgrel=1
pkgdesc="An open-source implementation of Netease Cloud Music's Orpheus browser host"
arch=('x86_64')
url="https://github.com/YUCLing/open-orpheus"
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libnotify'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
optdepends=('kde-cli-tools: move deleted files to the KDE trash')
makedepends=(
    'nodejs>=24'
    'pnpm'
    'rust'
    'rust-wasm'
)
options=('!debug' '!strip')
_wasm_bindgen_ver=0.2.123
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "wasm-bindgen-$_wasm_bindgen_ver.tar.gz::https://github.com/wasm-bindgen/wasm-bindgen/releases/download/$_wasm_bindgen_ver/wasm-bindgen-$_wasm_bindgen_ver-x86_64-unknown-linux-musl.tar.gz"
    "$pkgname.desktop"
)
sha256sums=('b79d1d98f8bac00cc4a23d43e120d1e46711194db53fc8a00159e9e1f3a51ebb'
            '80fc5c1d5c128fd67e99b14318eeabf79dfbadf459ece2d38ba93a82e55730c6'
            '259b39667fe1dce5d6ce45d4464b7499989c0b0d527c9b9d3597d519dd744e76')

prepare() {
    cd "$pkgname-$pkgver"

    pnpm install --frozen-lockfile
}

build() {
    cd "$pkgname-$pkgver"

    export PATH="$srcdir/wasm-bindgen-$_wasm_bindgen_ver-x86_64-unknown-linux-musl:$PATH"
    pnpm build:modules
    pnpm package
}

package() {
    cd "$pkgname-$pkgver"

    install -d "$pkgdir/opt/$pkgname"
    cp -a "out/$pkgname-linux-x64/." "$pkgdir/opt/$pkgname/"
    chmod 755 "$pkgdir/opt/$pkgname"
    chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 assets/icon_256.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
