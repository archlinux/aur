# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app
pkgver=0.8.9
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
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
#_release_hash="a46677832b14fcb9cc05b6fdaacaacba7ffeafc1"
source=(
    # WHY DO THEY NOT TAG THE RELEASES?!?!?! yooo they tagged 0.8.7 and didnt 0.8.8... but did 0.8.9!
    #"$pkgname-${_release_hash}.tar.gz::https://github.com/modrinth/code/archive/${_release_hash}.zip"
    "$pkgname-$pkgver.tar.gz::https://github.com/modrinth/code/archive/refs/tags/v${pkgver}.tar.gz"
    "modrinth-app.desktop"
    "modrinth-app"
    "modrinth-file-extensions.xml"
)
sha256sums=('2d41e8210c72649c9882c1c33be70a5365c08fb7f8e33c2080f1cc0ede9190fd'
            '3ac2484618a0b10a979f7ce37fb97e748609bfb3bcccda5018a583e12ac0dbda'
            '5404b4e7b25903afe43ab2f2451be4b27f4823c6785327b166f2faa519fa38a9'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')
options=('!lto')

prepare() {
    #cd "$srcdir/code-${_release_hash}/apps/app"
    cd "$srcdir/code-${pkgver}/apps/app"
    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"

    #cd "$srcdir/code-${_release_hash}/apps/app-frontend"
    cd "$srcdir/code-${pkgver}/apps/app-frontend"
    export COREPACK_ENABLE_STRICT=0
    pnpm install
}

build() {
    #cd "$srcdir/code-${_release_hash}/apps/app-frontend"
    cd "$srcdir/code-${pkgver}/apps/app-frontend"

    export COREPACK_ENABLE_STRICT=0
    pnpm build

    #cd "$srcdir/code-${_release_hash}/apps/app"
    cd "$srcdir/code-${pkgver}/apps/app"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
    #pnpm tauri build --no-bundle
    #pnpm tauri build --bundles none
}

package() {
    install -Dm755 "$srcdir"/modrinth-app "$pkgdir"/usr/bin/modrinth-app
    #install -Dm755 "$srcdir"/code-"${_release_hash}"/apps/app/target/release/theseus_gui "$pkgdir"/opt/modrinth-app/modrinth-app
    install -Dm755 "$srcdir"/code-"${pkgver}"/apps/app/target/release/theseus_gui "$pkgdir"/opt/modrinth-app/modrinth-app
    
    #install -Dm644 "$srcdir"/code-"${_release_hash}"/apps/app/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    install -Dm644 "$srcdir"/code-"${pkgver}"/apps/app/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    #install -Dm644 "$srcdir"/code-"${_release_hash}"/apps/app/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 "$srcdir"/code-"${pkgver}"/apps/app/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 modrinth-app.desktop "$pkgdir"/usr/share/applications/modrinth-app.desktop
    install -Dm644 "$srcdir"/modrinth-file-extensions.xml "$pkgdir"/usr/share/mime/packages/modrinth-file-extensions.xml
}
