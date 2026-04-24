# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-git
_name=${pkgname%-git}
pkgver=1.12.1.r58282.0ff71a5
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=(any)
url='https://proton.me/mail'
license=(GPL-3.0-or-later)
_electron=electron40
depends=(bash $_electron hicolor-icon-theme)
makedepends=(git jq nodejs-lts-jod yarn)
provides=($_name)
conflicts=($_name)
source=(ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git
        proton-mail.desktop
        proton-mail.sh
        fix-resources-path.patch)
b2sums=('SKIP'
        'f0a2b4eca51362b204f487c6484e07080b2d953f38acb3b7ce81a05394fe2f57e5fd42f8806111c467aa528e539654a6b1adc3965328668c4734b3eecf3407e9'
        '45d089576f2260cc425b6c9bdde79e882b24c7dd4b8173f485fb67a0d0ccaf451dbba6f403f3bd8a0d622d99132d076da79984525ed8f89e97738557e8e23bad'
        'e43bd152b71c8c049ddfb1306983a3591a8220ef1c2816d7a2deeca2cd4519cf622d735901ddc58455123343778cf21707a7287120aae0b4e285585dd9b79f51')

pkgver() {
    cd ProtonWebClients
    printf "%s.r%s.%s" \
        "$(jq -r '.version' applications/inbox-desktop/package.json)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ProtonWebClients

    # Fix resources path for system electron
    patch -Np1 -i "$srcdir/fix-resources-path.patch"

    # Find out which major release of electron this version of proton-mail requires
    local _electron_major=$(jq --raw-output '.devDependencies.electron' < "applications/inbox-desktop/package.json" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|$_electron|" "$srcdir/proton-mail.sh"

    # Configure Yarn workspaces to build only inbox-desktop (proton-mail) instead of all applications
    sed -i 's/"applications\/\*",/"applications\/inbox-desktop",/' package.json

    export YARN_CACHE_FOLDER="$srcdir/.yarn-cache"
    yarn install
}

build() {
    cd ProtonWebClients
    yarn workspace proton-inbox-desktop package
}

check() {
    cd ProtonWebClients
    yarn workspace proton-inbox-desktop test
}

package() {
    install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.desktop -t "$pkgdir/usr/share/applications"

    cd ProtonWebClients/applications/inbox-desktop
    install -d "$pkgdir/usr/share/$_name"
    cp out/"Proton Mail"-linux-*/resources/* "$pkgdir/usr/share/$_name/"

    cd assets
    install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_name.png"
    install -Dm644 icons/icon@2x.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$_name.png"
    install -Dm644 linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
}
