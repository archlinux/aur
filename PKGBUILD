# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
_rpmversion=7.7.3836.3-1
pkgver=7.7.3836.3
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. Snapshot'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'libcups'
    'libxss'
    'nss'
    'pango'
    'ttf-font'
    'desktop-file-utils'
    'shared-mime-info'
    'hicolor-icon-theme'
)
makedepends=('w3m')
optdepends=(
    'vivaldi-snapshot-ffmpeg-codecs: playback of proprietary video/audio'
    'org.freedesktop.secrets: better secret storage in gnome-keyring or kwallet'
    'libnotify: native notifications'
    'pipewire: WebRTC desktop sharing under Wayland'
    'gtk3: gtk3 integration'
    'gtk4: for use with --gtk-version=4'
    'qt5-base: qt5 integration'
    'qt6-base: qt6 integration'
    'upower: Battery Status API support'
)
source=("https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-${_rpmversion}.x86_64.rpm"
        '0001-add-support-for-user-flags.patch')
sha512sums=('e98bff1a81520d8a7183aa64e1ee2f1274ad3fee18022d0b54b6b3e1394345f2f2f2f9523cc66a6134e25053ca3d1e6aa7fc779f6f9d99cd573c089fd93fb459'
            'a9bdab0fb0f394af17d1b126bae2d0cdc55e63eaa6eaf36eb994735047d3d7bc5000d75ab930f74b76b283c5addefbd4e4e63c5e4f2908bd53c270e73641c19d')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # add support for ~/.config/vivaldi-snapshot.conf
    patch -p1 -i "$srcdir/0001-add-support-for-user-flags.patch" \
        "$pkgdir/opt/$pkgname/$pkgname"
    # remove "orig" leftover if it is there
    rm -f "$pkgdir/opt/$pkgname/$pkgname.orig"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/$pkgname/vivaldi-sandbox"

    # make /usr/bin/vivaldi-snapshot available
    binf="$pkgdir/usr/bin/$pkgname"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/$pkgname "$binf"
    fi

    # Vivaldi has different design for each size of icons. Avoid using them.
    install -d "$pkgdir/usr/share/pixmaps"
    ln -sf /opt/${pkgname}/product_logo_256.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump "$pkgdir/opt/$pkgname/LICENSE.html" \
        | head -n 5 \
        > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
