# Maintainer: Jan Was <janek.jan(at)gmail(dot)com>

pkgname=mattermost-desktop-bin
pkgdesc="Mattermost chat desktop client for Linux (binary)"
_pkgname=desktop
pkgver=1.3.0
pkgrel=1
pkgdesc="Mattermost Desktop (Beta) for Linux (binary)"
arch=('x86_64')
url="https://github.com/mattermost/desktop"
license=('MIT')
makedepends=('npm' 'gendesk')
depends=('gconf')
optdepends=()
conflicts=('mattermost', 'mattermost-desktop')

source=("https://releases.mattermost.com/desktop/1.3.0/mattermost-desktop-${pkgver}-linux-x64.tar.gz")

sha256sums=('eb349ff12a39cc5e29413c56480a0bcd7d3d991699647b364f0f8fb62499e4c2')

build() {
    cd "${srcdir}/mattermost-desktop-linux-x64"
}

prepare() {
    gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
        --exec "/usr/lib/mattermost/Mattermost" \
        --categories "GNOME;GTK;Network;InstantMessaging;"
}

package() {
    cd "${srcdir}/mattermost-desktop-linux-x64"

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    echo `ls -l`
    cp -r * "$pkgdir/usr/lib/mattermost"
    rm $pkgdir/usr/lib/mattermost/LICENSE

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/Mattermost "$pkgdir/usr/bin/mattermost"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/resources/app/resources/appicon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

