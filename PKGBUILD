# Maintainer: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="Mattermost Desktop (Beta) for Linux (binary)"
arch=('x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=('gendesk')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'nspr' 'alsa-lib')
optdepends=()

conflicts=('mattermost-desktop')

source=("https://releases.mattermost.com/desktop/${pkgver}/mattermost-desktop-${pkgver}-linux-x64.tar.gz")
sha512sums=('f46f13045850579c49a87ab2a01caf3c3d95ac6bb9bc807c414413df6804ea36342bbc0a31a75d10a3b048dc3ac5a3efe8c26883c0705aec8875900366b9b58a')

prepare() {
    cd "${srcdir}/mattermost-desktop-${pkgver}"

    gendesk -f -n \
        --pkgname "mattermost-desktop" \
        --pkgdesc "Open source, private cloud Slack-alternative" \
        --name "Mattermost Desktop (Beta)" \
        --exec "/usr/lib/mattermost/mattermost-desktop" \
        --categories "Network;Chat;InstantMessaging;VideoConference;GTK"
}

package() {
    cd "${srcdir}/mattermost-desktop-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/mattermost-desktop "$pkgdir/usr/bin/mattermost-desktop"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 mattermost-desktop.desktop "$pkgdir/usr/share/applications/mattermost-desktop.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.png" "$pkgdir/usr/share/pixmaps/mattermost-desktop.png"
}
