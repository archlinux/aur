# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail
pkgver=1.9.1
pkgrel=2
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=('any')
url='https://proton.me/mail'
license=('GPL-3.0-or-later')
depends=('bash' 'electron35' 'hicolor-icon-theme')
makedepends=('git' 'nodejs-lts' 'yarn')
source=("WebClients-proton-inbox-desktop::git+https://github.com/ProtonMail/WebClients.git#branch=release/inbox-desktop@$pkgver"
        'proton-mail.desktop'
        'proton-mail.sh')
b2sums=('SKIP'
        'dbaec179f629964aac699677b09219e0494426c624d00896c18177263e38dac7fb0383702d9cf22fc617a77809d826d5a8a2348f4a31a6ec069ce642af3671be'
        '21605b0d31062d2b355e8422f319521a775efd41ef34571a114fd7f9f1ba07b39b4a27998fd11d2039baa7ba0650b804dfd41e0d591ead622fce68243dca1d88')

prepare() {
    cd WebClients-proton-inbox-desktop
    sed -i 's/"applications\/\*",/"applications\/inbox-desktop",/' package.json
}

build() {
    cd WebClients-proton-inbox-desktop
    yarn install
    yarn workspace proton-inbox-desktop package
}

check() {
    cd WebClients-proton-inbox-desktop
    yarn workspace proton-inbox-desktop test
}

package() {
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd WebClients-proton-inbox-desktop/applications/inbox-desktop

    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r "out/Proton Mail-linux-x64/resources"/* "$pkgdir/usr/share/$pkgname/"

    cd assets
    install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 icons/icon@2x.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm644 linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
