# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=open-orpheus
pkgver=0.17.0
pkgrel=2
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
# Thanks @Misaka19465
# optdepends=('kde-cli-tools: move deleted files to the KDE trash')
makedepends=(
    'nodejs>=24'
    'pnpm'
    'rust'
    'rust-wasm'
)
options=('!debug' '!strip')
_wasm_bindgen_ver=0.2.128
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "wasm-bindgen-$_wasm_bindgen_ver.tar.gz::https://github.com/wasm-bindgen/wasm-bindgen/releases/download/$_wasm_bindgen_ver/wasm-bindgen-$_wasm_bindgen_ver-x86_64-unknown-linux-musl.tar.gz"
    "$pkgname.desktop"
)
sha256sums=('733099d273718e9f27b2776e519f73edd8d4dd0b2e471c6b8bc2cb7fb3f44b3e'
            'b51f0208fdff83515a787bd8ab9ac5865ed84dabb66d0c709957bb59793c645f'
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
