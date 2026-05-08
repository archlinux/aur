# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-meet
pkgver=1.0.9
pkgrel=2
pkgdesc='Secure, end-to-end encrypted video conferencing'
arch=(any)
url='https://proton.me/meet'
license=(GPL-3.0-or-later)
_electron=electron39
depends=(bash $_electron hicolor-icon-theme)
makedepends=(git jq nodejs-lts-jod yarn)
source=(ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git#tag=proton-meet-desktop@$pkgver
        proton-meet.desktop
        proton-meet.sh)
b2sums=('e21604a220ca689c2a8c9e68e13619a6f19a3fd1301c3811eaa8ad498cf647a6a1df3088fe51bd1566a3fc1c8d59eecf14f2e2811681a36414746e1e885cbfe7'
        'efdcc089844bf0287c61e7d5f8c6aa9f5721a6000751b887a586f3a5b5caf36686500b09c10dc3039e6914be804c155edf67a0be17640602221d96a25e1a197c'
        'cc16def864fd2e9134c194b473db94b0588871af895803fe4151ab7b715f66bbbb695a0964c03577da12b72397230626dabf186885cd206de412c8eac3a47e4a')

prepare() {
    cd ProtonWebClients

    # Find out which major release of electron this version of proton-mail requires
    local _electron_major=$(jq --raw-output '.devDependencies.electron' < "applications/meet-desktop/package.json" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|$_electron|" "$srcdir/proton-meet.sh"

    # Configure Yarn workspaces to build only meet-desktop instead of all applications
    sed -i 's/"applications\/\*",/"applications\/meet-desktop",/' package.json

    export YARN_CACHE_FOLDER="$srcdir/.yarn-cache"
    yarn install
}

build() {
    cd ProtonWebClients
    yarn workspace proton-meet-desktop package
}

check() {
    cd ProtonWebClients
    yarn workspace proton-meet-desktop test
}

package() {
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"

    cd ProtonWebClients/applications/meet-desktop
    install -d "$pkgdir/usr/share/$pkgname"
    cp out/"Proton Meet"-linux-*/resources/* "$pkgdir/usr/share/$pkgname/"

    cd assets
    install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 icons/icon@2x.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm644 linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
