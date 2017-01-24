# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Jan Was <janek dot jan at gmail dot com>

pkgname=mattermost-desktop
pkgver=3.5.0
pkgrel=3
pkgdesc="Mattermost Desktop application for Linux (Beta)"
arch=('i686' 'x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=('npm' 'gendesk' 'libicns' 'graphicsmagick')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'nspr' 'alsa-lib')
optdepends=()

source=("https://github.com/mattermost/desktop/archive/v${pkgver}.tar.gz")
sha512sums=('06924e4ce18cbe8fd50c0742a74b0a2ec732c7a419bb741c6991097a0a7be01afdfc4ce43125856508aa06750e35d12ce34d06a1e5d6eb6ddd14e81a0a6dffba')

prepare() {
    cd "${srcdir}/desktop-${pkgver}"

    # Depending on the architecture, in order to accelerate the build process,
    # removes the compilation of ia32 or x64 build.
    case "$CARCH" in
        i686)
            sed -i 's/build --linux --x64 --ia32/build --linux --ia32/g' package.json
            ;;
        x86_64)
            sed -i 's/build --linux --x64 --ia32/build --linux --x64/g' package.json
            ;;
    esac

    # Generate a desktop entry
    # -f: forces and overrides the file if any
    # -n: do not download an icon
    # This tool assumes the icon has the same name as pkgname.
    # For categories see https://standards.freedesktop.org/menu-spec/latest/apa.html
    gendesk -f -n \
        --pkgname "$pkgname" \
        --pkgdesc "Open source, private cloud Slack-alternative" \
        --name "Mattermost Desktop (Beta)" \
        --exec "/usr/lib/mattermost/mattermost-desktop" \
        --categories "Network;Chat;InstantMessaging;VideoConference;GTK"
}

build() {
    cd "${srcdir}/desktop-${pkgver}"
    npm install
    npm run package:linux
}

package() {
    cd "${srcdir}/desktop-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib
    case "$CARCH" in
        i686)
            _release="linux-ia32-unpacked"
            ;;
        x86_64)
            _release="linux-unpacked"
            ;;
    esac

    cp -r release/${_release} "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/mattermost-desktop "$pkgdir/usr/bin/mattermost-desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

