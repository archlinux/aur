# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app
pkgver=0.8.5
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
makedepends=('rust' 'pnpm')
depends=(
    # tauri deps
    'openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk-4.1'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
_release_hash="bd61f5d5915f8a899f2075037358b0f3bcd23fe8"
source=(
    # WHY DO THEY NOT TAG THE RELEASES?!?!?!
    #"$pkgname-$pkgver.tar.gz::https://github.com/modrinth/code/archive/refs/tags/v${pkgver}.tar.gz"
    "$pkgname-${_release_hash}.tar.gz::https://github.com/modrinth/code/archive/${_release_hash}.zip"
    "modrinth-app.desktop"
    "modrinth-app"
)
sha256sums=('0802c6c80834cde4f63c7ddfe3d36ac165205385f8c0e5317fa199f192616314'
            '7f6673916e0cf1cef2f2e3d1e5865d722abcbd8fba879688f8102816773a9d44'
            '5404b4e7b25903afe43ab2f2451be4b27f4823c6785327b166f2faa519fa38a9')
options=('!lto')

prepare() {
    # temporary
    mv "$srcdir/code-${_release_hash}" "$srcdir/code-${pkgver}"

    cd "$srcdir/code-$pkgver/apps/app"
    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    cd "$srcdir/code-$pkgver/apps/app-frontend"
    export COREPACK_ENABLE_STRICT=0
    pnpm install
}

build() {
    cd "$srcdir/code-$pkgver/apps/app-frontend"

    export COREPACK_ENABLE_STRICT=0
    pnpm build

    cd "$srcdir/code-$pkgver/apps/app"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    #cargo build --frozen --release --all-features
    pnpm tauri build --no-bundle
}

package() {
    install -Dm755 "$srcdir"/modrinth-app "$pkgdir"/usr/bin/modrinth-app
    install -Dm755 "$srcdir"/code-"$pkgver"/apps/app/target/release/theseus_gui "$pkgdir"/opt/modrinth-app/modrinth-app
    
    install -Dm644 "$srcdir"/code-"$pkgver"/apps/app/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    install -Dm644 "$srcdir"/code-"$pkgver"/apps/app/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 modrinth-app.desktop "$pkgdir"/usr/share/applications/modrinth-app.desktop
}
