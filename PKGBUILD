# Maintainer: Jan Was <janek.jan(at)gmail(dot)com>

pkgname=mattermost-desktop
pkgdesc="Mattermost chat desktop client for Linux"
_pkgname=desktop
pkgver=3.5.0
pkgrel=2
pkgdesc="Mattermost Desktop (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://github.com/mattermost/desktop"
license=('MIT')
makedepends=('npm' 'gendesk' 'libicns' 'graphicsmagick')
depends=('gconf' 'nodejs' 'ffmpeg')
optdepends=()

source=("https://github.com/mattermost/desktop/archive/v${pkgver}.tar.gz")

sha256sums=('9948a5647906c6e759961072f838cebb38c5649a112fe9d053b90ec13e2c564c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package:linux
}

prepare() {
    gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
        --exec "/usr/lib/mattermost/mattermost-desktop" \
        --categories "GNOME;GTK;Network;InstantMessaging;"
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib
    case "$CARCH" in
        i686) _release="linux-ia32-unpacked"
            ;;
        x86_64) _release="linux-unpacked"
            ;;
    esac

    cp -r release/${_release} "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/mattermost-desktop "$pkgdir/usr/bin/mattermost-desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

