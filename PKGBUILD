# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app
pkgver=0.5.4
pkgrel=2
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
makedepends=('rust' 'pnpm')
depends=(
    # tauri deps
    'openssl' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
conflicts=('modrinth-app-bin' 'modrinth-app-git')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/modrinth/theseus/archive/refs/tags/v${pkgver}.tar.gz"
    "modrinth-app.desktop"
)
sha256sums=('c2e974f8f7bfc63edfee979395de5c2ff148be57df939121f88e159897f7689c'
            'ad8f7ffea0435881acdd7ecb560443e281982727dc7c715885367e9466bc0a62')
options=('!lto')

prepare() {
    cd "theseus-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    cd "theseus_gui"
    pnpm install --frozen-lockfile --no-optional
}

build() {
    cd "theseus-${pkgver}/theseus_gui/"

    pnpm build

    cd ..

    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --all-features
}

check() {
    cd "theseus-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm755 "$srcdir"/theseus-"$pkgver"/target/release/theseus_gui "$pkgdir"/usr/bin/modrinth-app
    
    install -Dm644 "$srcdir"/theseus-"$pkgver"/theseus_gui/src-tauri/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    install -Dm644 "$srcdir"/theseus-"$pkgver"/theseus_gui/src-tauri/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 modrinth-app.desktop "$pkgdir"/usr/share/applications/modrinth-app.desktop
}
