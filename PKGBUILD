# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
_rpmversion=7.2.3621.36-1
pkgver=7.2.3621.36
pkgrel=2
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
makedepends=('w3m' 'imagemagick')
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
sha512sums=('f52452efecf3d9fc0c32dfb5c938be9144bac96aec17df34c84b92f9f36e05037d0fb6e6715234cdabad83901979de43998a60695af9e3e77ef607a2f9dab236'
            'a9bdab0fb0f394af17d1b126bae2d0cdc55e63eaa6eaf36eb994735047d3d7bc5000d75ab930f74b76b283c5addefbd4e4e63c5e4f2908bd53c270e73641c19d')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # add support for ~/.config/vivaldi-soprano.conf
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

    # 256 and 24 are proper colored icons
    for res in 128 64 48 32; do
        magick convert "$pkgdir/opt/$pkgname/product_logo_256.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/$pkgname/product_logo_$res.png"
    done
    for res in 22 16; do
        convert "$pkgdir/opt/$pkgname/product_logo_24.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/$pkgname/product_logo_$res.png"
    done

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/$pkgname/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
    done

    # install global icon in case hicolor theme gets bypassed
    install -Dm644 "$pkgdir/opt/$pkgname/product_logo_256.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump "$pkgdir/opt/$pkgname/LICENSE.html" \
        | head -n 5 \
        > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
