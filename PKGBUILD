# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail
pkgver=1.13.3
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=(any)
url='https://proton.me/mail'
license=(GPL-3.0-or-later)
_electron=electron40
depends=(bash $_electron hicolor-icon-theme)
makedepends=(git jq nodejs-lts-jod yarn)
source=(https://github.com/ProtonMail/WebClients/archive/proton-inbox-desktop@$pkgver/$pkgname-$pkgver.tar.gz
        proton-mail.desktop
        proton-mail.sh)
b2sums=('11d54df063a933d9c98e181d1dc804feaa7265b292e2b1f79655d234be47fb2df6752d5313b47e165b84251581524c1f1afd28a7864cd0488c60231a34e7fce0'
        'f0a2b4eca51362b204f487c6484e07080b2d953f38acb3b7ce81a05394fe2f57e5fd42f8806111c467aa528e539654a6b1adc3965328668c4734b3eecf3407e9'
        '45d089576f2260cc425b6c9bdde79e882b24c7dd4b8173f485fb67a0d0ccaf451dbba6f403f3bd8a0d622d99132d076da79984525ed8f89e97738557e8e23bad')

prepare() {
    cd WebClients-proton-inbox-desktop-$pkgver

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
    export SENTRYCLI_SKIP_DOWNLOAD=1
    yarn install
}

build() {
    cd WebClients-proton-inbox-desktop-$pkgver
    yarn workspace proton-inbox-desktop package
}

check() {
    cd WebClients-proton-inbox-desktop-$pkgver
    yarn workspace proton-inbox-desktop test
}

package() {
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"

    cd WebClients-proton-inbox-desktop-$pkgver/applications/inbox-desktop
    install -d "$pkgdir/usr/share/$pkgname"
    cp out/"Proton Mail"-linux-*/resources/* "$pkgdir/usr/share/$pkgname/"

    cd assets
    install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 icons/icon@2x.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm644 linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
