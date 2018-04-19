# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>
# Contributor: William Gathoye <william at gathoye dot be>
# Contributor: Jan Was <janek dot jan at gmail dot com>

pkgname=mattermost-desktop
pkgver=4.0.1
pkgrel=1
pkgdesc="Mattermost Desktop application for Linux (Beta)"
arch=('i686' 'x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
makedepends=('npm' 'gendesk' 'graphicsmagick' 'git')

source=("https://github.com/mattermost/desktop/archive/v${pkgver}.tar.gz")
sha512sums=('24385373b2f87b2f51f80bf000f774638983ce4d61fbde1e4f4145a0bddd7cc5aa22ba4785065b60b67920a56c3539716560bee7a6f303d203967b260c9d94f6')

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

    # Reduce build time by removing the creation of a .deb for Debian
    sed -i -e '/^[[:space:]]*"target": \[/!b' -e '$!N;s/\n[[:space:]]*"deb",//' electron-builder.json

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
    npm install --cache "${srcdir}/npm-cache"
    npm run build --cache "${srcdir}/npm-cache"
    npm run package:linux --cache "${srcdir}/npm-cache"
}

package() {
    cd "${srcdir}/desktop-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib
    cp -r release/linux*unpacked "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/mattermost-desktop "$pkgdir/usr/bin/mattermost-desktop"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

