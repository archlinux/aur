# Maintainer: Antti <antti@antti.codes>
# Ex-Maintainer: Nixuge

pkgname=modrinth-app-git
pkgver=0.15.0.r1.g80d66d3
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo' 'pnpm' 'java-environment>=17' 'git' 'npm' 'node-gyp')
depends=(
    'libgcc' 'glibc' 'sh'
    'libvips'
    # tauri deps
    'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
    'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
    'java-environment: system java'
)
conflicts=('modrinth-app')
provides=('modrinth-app')
source=(
    "git+https://github.com/modrinth/code"
    "modrinth-app.desktop"
    "modrinth-app.sh"
    "modrinth-file-extensions.xml"
)
sha256sums=('SKIP'
            '3ac2484618a0b10a979f7ce37fb97e748609bfb3bcccda5018a583e12ac0dbda'
            '77521865ef561e156eed2ac23a931307f8d98093e9feb022de89188970fabee7'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')
options=('!lto')

pkgver() {
    cd "$srcdir/code"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
        | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/code"
    git reset --hard HEAD
    git_tag="$(git describe --tags --abbrev=0 --exclude='*[a-zA-Z][a-zA-Z]*' | sed 's/^v//')"
    sed -i "s/1.0.0-local/$git_tag/" "apps/app/Cargo.toml"
    sed -i "s/1.0.0-local/$git_tag/" "packages/app-lib/Cargo.toml"
    sed -i "s/1.0.0-local/$git_tag/" "apps/app-frontend/package.json"
    sed -i "s/1.0.0-local/$git_tag/" "Cargo.lock"

    export NODE_PATH="/usr/lib/node_modules"
    export TURBO_TELEMETRY_DISABLED=1
    pnpm install --frozen-lockfile

    cp -f "packages/app-lib/.env.prod" "packages/app-lib/.env"

    cd "apps/app"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/code"
    export NODE_PATH="/usr/lib/node_modules"
    export TURBO_TELEMETRY_DISABLED=1
    pnpm --filter=@modrinth/app run tauri build --config tauri-release.conf.json --no-bundle
}

package() {
    install -Dm755 modrinth-app.sh "$pkgdir/usr/bin/modrinth-app"
    install -Dm644 modrinth-app.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 modrinth-file-extensions.xml -t "$pkgdir/usr/share/mime/packages/"
    
    cd "$srcdir/code"
    install -Dm755 target/release/ModrinthApp "$pkgdir/usr/lib/modrinth-app"
    install -Dm644 apps/app/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/modrinth-app.png"
    install -Dm644 apps/app/icons/icon.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png"
}
