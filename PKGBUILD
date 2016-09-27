# Maintainer: Jan Was <janek.jan(at)gmail(dot)com>

pkgname=mattermost-desktop
pkgdesc="Mattermost chat desktop client for Linux"
_pkgname=desktop
pkgver=3.4.0
pkgrel=1
pkgdesc="Mattermost Desktop (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://github.com/mattermost/desktop"
license=('MIT')
makedepends=('npm' 'gendesk')
depends=('gconf' 'nodejs' 'ffmpeg')
optdepends=()
conflicts=('mattermost')

source=("https://github.com/mattermost/desktop/archive/v${pkgver}.tar.gz")

sha256sums=('fdebdc28c43ac6429f696bee5ba1a83ec3fd1b6e25da9c59aed7189e0c2f47b9')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package
}

prepare() {
    gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
        --exec "/usr/lib/mattermost/Mattermost" \
        --categories "GNOME;GTK;Network;InstantMessaging;"
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib
    case "$CARCH" in
        i686) _release="Mattermost-linux-ia32"
            ;;
        x86_64) _release="Mattermost-linux-x64"
            ;;
    esac

    cp -r release/${_release} "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/Mattermost "$pkgdir/usr/bin/mattermost"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/resources/app/resources/appicon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

