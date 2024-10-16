# Maintainer: Antti <antti@antti.codes>
# Ex-Maintainer: Nixuge

pkgname=modrinth-app-git
pkgver=0.8.9.r1503.356a06e
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('rust' 'pnpm' 'git' 'jq')
depends=(
    # tauri deps
    'openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk-4.1'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
conflicts=('modrinth-app')
provides=('modrinth-app')
source=(
    "git+https://github.com/modrinth/code"
    "modrinth-app.desktop"
    "modrinth-app"
    "modrinth-file-extensions.xml"
)
sha256sums=('SKIP'
            '3ac2484618a0b10a979f7ce37fb97e748609bfb3bcccda5018a583e12ac0dbda'
            '5404b4e7b25903afe43ab2f2451be4b27f4823c6785327b166f2faa519fa38a9'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')
options=('!lto')

pkgver() {
	cd "$srcdir/code"
	printf "%s.r%s.%s" "$(cat apps/app/tauri.conf.json | jq -r .version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/code/apps/app"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"

    cd "$srcdir/code/apps/app-frontend"
    export COREPACK_ENABLE_STRICT=0
    pnpm install
}

build() {
    cd "$srcdir/code/apps/app-frontend/"

    export COREPACK_ENABLE_STRICT=0
    pnpm build

    cd "$srcdir/code/apps/app"
    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
    #pnpm tauri build --no-bundle
    #pnpm tauri build --bundles none
}

package() {
    install -Dm755 "$srcdir"/modrinth-app "$pkgdir"/usr/bin/modrinth-app
    install -Dm755 "$srcdir"/code/apps/app/target/release/theseus_gui "$pkgdir"/opt/modrinth-app/modrinth-app
    
    install -Dm644 "$srcdir"/code/apps/app/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    install -Dm644 "$srcdir"/code/apps/app/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 modrinth-app.desktop "$pkgdir"/usr/share/applications/modrinth-app.desktop
    install -Dm644 "$srcdir"/modrinth-file-extensions.xml "$pkgdir"/usr/share/mime/packages/modrinth-file-extensions.xml
}
