# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail
pkgver=1.10.1
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=('any')
url='https://proton.me/mail'
license=('GPL-3.0-or-later')
depends=('bash' 'electron36' 'hicolor-icon-theme')
makedepends=('git' 'nodejs-lts-jod' 'yarn')
source=("ProtonWebClients-$pkgver::git+https://github.com/ProtonMail/WebClients.git#branch=release/inbox-desktop@$pkgver"
        'proton-mail.desktop'
        'proton-mail.sh')
b2sums=('SKIP'
        'f0a2b4eca51362b204f487c6484e07080b2d953f38acb3b7ce81a05394fe2f57e5fd42f8806111c467aa528e539654a6b1adc3965328668c4734b3eecf3407e9'
        'd71722fd78770b2025464fcde201b4ab18e58afc269105ea389a6d4665a6a0801adcece53507004c56722ba8954ee7fd6b5de3eec3b099c6cc67e206f14cf4aa')

prepare() {
    cd ProtonWebClients-$pkgver
    sed -i 's/"applications\/\*",/"applications\/inbox-desktop",/' package.json
}

build() {
    cd ProtonWebClients-$pkgver
    export YARN_CACHE_FOLDER="$srcdir/.yarn-cache"
    yarn install
    yarn workspace proton-inbox-desktop package
}

check() {
    cd ProtonWebClients-$pkgver
    yarn workspace proton-inbox-desktop test
}

package() {
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd ProtonWebClients-$pkgver/applications/inbox-desktop

    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r "out/Proton Mail-linux-x64/resources"/* "$pkgdir/usr/share/$pkgname/"

    cd assets
    install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 icons/icon@2x.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm644 linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
