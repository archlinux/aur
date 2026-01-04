# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-git
_name=${pkgname%-git}
pkgver=1.34.0.r53453.5d85ec7
pkgrel=1
pkgdesc='Proton official password manager'
arch=('x86_64')
url='https://proton.me/pass'
license=('GPL-3.0-or-later')
_electron=electron39
depends=('bash' "$_electron" 'hicolor-icon-theme')
makedepends=('git' 'jq' 'nodejs-lts-jod' 'npm' 'rustup' 'yarn')
provides=("$_name")
conflicts=("$_name")
source=('ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git'
        'proton-pass.desktop'
        'proton-pass.sh')
b2sums=('SKIP'
        '8c98df9532c76667ee88211be72b14b233f9fb84e921bfb045ae6f9d74dc314489a9917452246018c1923e9d99fb5e195cf137f656e1f1d17bd8d22f9369c054'
        '9d30272588cb239c81c8cf91385cbde044701cb8eccb884be2e51b3248a15a93f10e2eccdde732c041564a80a1feb8a23c91a90ea9651a3dd448e5540d4e2570')

pkgver() {
    cd ProtonWebClients
    printf "%s.r%s.%s" \
        "$(jq -r '.version' applications/pass-desktop/package.json)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ProtonWebClients

    # Find out which major release of electron this version of proton-pass requires
    local _electron_major=$(jq --raw-output '.devDependencies.electron' < "applications/pass-desktop/package.json" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|$_electron|" "$srcdir/proton-pass.sh"

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
