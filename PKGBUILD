# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-git
_name=${pkgname%-git}
_electron=electron37
pkgver=1.32.11.r51486.66b7aad
pkgrel=1
pkgdesc='Proton official password manager'
arch=('x86_64')
url='https://proton.me/pass'
license=('GPL-3.0-or-later')
depends=('bash' "$_electron" 'hicolor-icon-theme')
makedepends=('git' 'jq' 'nodejs-lts-jod' 'npm' 'rustup' 'yarn')
provides=("$_name")
conflicts=("$_name")
source=('ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git'
        'proton-pass.desktop'
        'proton-pass.sh')
b2sums=('SKIP'
        '8c98df9532c76667ee88211be72b14b233f9fb84e921bfb045ae6f9d74dc314489a9917452246018c1923e9d99fb5e195cf137f656e1f1d17bd8d22f9369c054'
        '84235372e9f8b9f5a8129c46e6fa75a9b7de66dce0b66e91ebfed25001d8c4ba3b62e7f186fcffc13c8344d33e0c7f7472405ac4b963ae0ab7fc59d9195e925e')

pkgver() {
    cd ProtonWebClients
    printf "%s.r%s.%s" \
        "$(jq -r '.version' applications/pass-desktop/package.json)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ProtonWebClients

    local _electronver=$(jq -r '.devDependencies.electron | ltrimstr("^")' applications/pass-desktop/package.json)
    if [[ -z "$_electronver" || "$_electronver" == "null" ]]; then
        echo "Failed to read electron version from source" >&2
        exit 1
    fi
    if [[ "electron${_electronver%%.*}" != "$_electron" ]]; then
        echo "Electron version mismatch: source requires electron${_electronver%%.*} but PKGBUILD specifies $_electron" >&2
        exit 1
    fi

    # Change electron binary name to the target electron
    sed "s|/usr/bin/electron|/usr/bin/$_electron|" -i ../proton-pass.sh

    # Limit workspace applications to pass and pass-desktop
    sed -i 's/"applications\/\*",/"applications\/pass", "applications\/pass-desktop",/' package.json

    # Disable unnecessary musl target
    sed -i "s/return \['x86_64-unknown-linux-musl', 'x86_64-unknown-linux-gnu'\]/return ['x86_64-unknown-linux-gnu']/" \
        applications/pass-desktop/native/build.js

    # Fix tray icon path to use app directory
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

    cd "ProtonWebClients/applications/pass-desktop/out/Proton Pass-linux-x64/resources"
    install -Dm644 app.asar "$pkgdir/usr/lib/$_name/resources/app.asar"

    install -dm755 "$pkgdir/usr/lib/$_name/resources/assets"
    cp assets/tray* "$pkgdir/usr/lib/$_name/resources/assets/"
    install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
    install -Dm644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_name.png"
}
