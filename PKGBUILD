# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app
pkgver=0.7.1
pkgrel=3
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
makedepends=('rust' 'pnpm')
depends=(
    # tauri deps
    'openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/modrinth/theseus/archive/refs/tags/v${pkgver}.tar.gz"
    "modrinth-app.desktop"
    "modrinth-app"
)
sha256sums=('512142172e71afb64e3ab749d7e6dff12efdcdbcecf287e1c6635929b7719bcf'
            'ad8f7ffea0435881acdd7ecb560443e281982727dc7c715885367e9466bc0a62'
            '5404b4e7b25903afe43ab2f2451be4b27f4823c6785327b166f2faa519fa38a9')
options=('!lto')

prepare() {
    cd "theseus-${pkgver}"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    cd "theseus_gui"
    export COREPACK_ENABLE_STRICT=0
    pnpm install
}

build() {
    cd "theseus-${pkgver}/theseus_gui/"

    export COREPACK_ENABLE_STRICT=0
    pnpm build

    cd ..

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --all-features
}

check() {
    cd "theseus-${pkgver}"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm755 "$srcdir"/modrinth-app "$pkgdir"/usr/bin/modrinth-app
    install -Dm755 "$srcdir"/theseus-"$pkgver"/target/release/theseus_gui "$pkgdir"/opt/modrinth-app/modrinth-app
    
    install -Dm644 "$srcdir"/theseus-"$pkgver"/theseus_gui/src-tauri/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    install -Dm644 "$srcdir"/theseus-"$pkgver"/theseus_gui/src-tauri/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 modrinth-app.desktop "$pkgdir"/usr/share/applications/modrinth-app.desktop
}
