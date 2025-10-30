# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app
pkgver=0.10.16
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('rust' 'pnpm' 'java-environment>=17')
depends=(
    # tauri deps
    'openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk-4.1' 'gst-plugins-good'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/modrinth/code/archive/refs/tags/v${pkgver}.tar.gz"
    "modrinth-app.desktop"
    "modrinth-app"
    "modrinth-file-extensions.xml"
)
sha256sums=('6eaca1f9fc36398caa60b472c42b61648609de45533cdc93e55055df692b6419'
            '3ac2484618a0b10a979f7ce37fb97e748609bfb3bcccda5018a583e12ac0dbda'
            'da70f89aae82e69625bfe920fa52961550c8f9d4825a0d11e620ac55db84e091'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')
options=('!lto')

prepare() {
    cd "$srcdir/code-$pkgver"
    sed -i "s/1.0.0-local/$pkgver/" "apps/app/Cargo.toml"
    sed -i "s/1.0.0-local/$pkgver/" "packages/app-lib/Cargo.toml"
    sed -i "s/1.0.0-local/$pkgver/" "apps/app-frontend/package.json"

    export COREPACK_ENABLE_STRICT=0
    pnpm install

    cp -f "packages/app-lib/.env.prod" "packages/app-lib/.env"

    cd "$srcdir/code-$pkgver/apps/app"
    
    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/code-$pkgver"
    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    export COREPACK_ENABLE_STRICT=0
    pnpm --filter=@modrinth/app run tauri build --config tauri-release.conf.json --no-bundle
}

package() {
    install -Dm755 "$srcdir"/modrinth-app "$pkgdir"/usr/bin/modrinth-app
    install -Dm755 "$srcdir"/code-"${pkgver}"/apps/app/target/release/ModrinthApp "$pkgdir"/opt/modrinth-app/modrinth-app

    install -Dm644 "$srcdir"/code-"${pkgver}"/apps/app/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    install -Dm644 "$srcdir"/code-"${pkgver}"/apps/app/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 modrinth-app.desktop "$pkgdir"/usr/share/applications/modrinth-app.desktop
    install -Dm644 "$srcdir"/modrinth-file-extensions.xml "$pkgdir"/usr/share/mime/packages/modrinth-file-extensions.xml
}
