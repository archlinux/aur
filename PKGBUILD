# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
_rpmversion=8.2.4133.38-1
pkgver=8.2.4133.38
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
    'libxcomposite'
    'libxdamage'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'mesa'
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
sha512sums=('77465279fd3a992054ff08f83e28c94f7d66db31b88c13778a15b683971f5bef64780eca539f5113aef0785f2cc96e443c8199e600d534a2344d49ae323f9dbb'
            '6b230614419416c44adf8fc2a677f8b1f1aca16949d20b7499417737001a6e9e314fc5841afaf402ad55b09910fca4c70fa7b6d38509b0546959bdbefb036726')

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
    # hicolor xdg fallback
    install -Dm644 "$pkgdir/opt/$pkgname/product_logo_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    for _res in 128 64 48 32 22; do
        install -d "$pkgdir/usr/share/icons/hicolor/${_res}x${_res}/apps"
        magick "$pkgdir/opt/$pkgname/product_logo_256.png" \
            -resize ${_res}x${_res} \
            "$pkgdir/usr/share/icons/hicolor/${_res}x${_res}/apps/$pkgname.png"
        chmod 0644 \
            "$pkgdir/usr/share/icons/hicolor/${_res}x${_res}/apps/$pkgname.png"
    done
    install -d "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$pkgdir/opt/$pkgname/product_logo_256.png" \
        "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    rm -f "$pkgdir/opt/$pkgname/product_logo_"*.png

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump "$pkgdir/opt/$pkgname/LICENSE.html" \
        | head -n 5 \
        > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
