# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-git
_name=${pkgname%-git}
pkgver=1.32.11.r51427.070162c
pkgrel=1
pkgdesc='Proton official password manager'
arch=('x86_64')
url='https://proton.me/pass'
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'cairo'
    'dbus'
    'electron37'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
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
)
makedepends=('git' 'jq' 'nodejs-lts-jod' 'npm' 'rustup' 'yarn')
provides=("$_name")
conflicts=("$_name")
source=('ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git'
        'proton-pass.desktop'
        'proton-pass.sh')
b2sums=('SKIP'
        '8c98df9532c76667ee88211be72b14b233f9fb84e921bfb045ae6f9d74dc314489a9917452246018c1923e9d99fb5e195cf137f656e1f1d17bd8d22f9369c054'
        'd536926286495b661a705943635a8203907f1d9d541b6168098c02826815a2d489a205b2b5e2ad26797d8d21e7555bce6762005e4ccc3ff0015d932ef2e7f936')

pkgver() {
    cd ProtonWebClients
    printf "%s.r%s.%s" \
        "$(jq -r '.version' applications/pass-desktop/package.json)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ProtonWebClients
    # Limit workspace applications to pass and pass-desktop
    sed -i 's/"applications\/\*",/"applications\/pass", "applications\/pass-desktop",/' package.json

    # Disable unnecessary musl target
    sed -i "s/return \['x86_64-unknown-linux-musl', 'x86_64-unknown-linux-gnu'\]/return ['x86_64-unknown-linux-gnu']/" \
        applications/pass-desktop/native/build.js

    # Fix tray icon path for system electron (dirname to get parent of asar)
    sed -i "s/app.isPackaged ? process.resourcesPath : app.getAppPath()/require('path').dirname(app.getAppPath())/" \
        applications/pass-desktop/src/main.ts
}

build() {
    cd ProtonWebClients
    export YARN_CACHE_FOLDER="$srcdir/.yarn-cache"
    export RUSTUP_TOOLCHAIN=stable
    yarn install
    yarn workspace proton-pass-desktop build:desktop
}

check() {
    cd ProtonWebClients
    yarn workspace proton-pass-desktop test:ci
}

package() {
    install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"

    cd ProtonWebClients/applications/pass-desktop
    install -dm755 "$pkgdir/opt/$_name"
    cp -r "out/Proton Pass-linux-x64"/* "$pkgdir/opt/$_name/"

    install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
    install -Dm644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_name.png"

    # Remove unnecessary platform-specific images
    rm -f "$pkgdir/opt/$_name/assets"/{*.icns,*.ico,*.gif,dmg-background.png}
}
