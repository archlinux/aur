# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Matthew Zilvar <mattzilvar@gmail.com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi/

pkgname=vivaldi-arm64
_pkgname=vivaldi
pkgver=3.1.1929.34
_pkgver=3.1.1929.34-1
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
options=('!strip' '!emptydirs')
license=('custom')
arch=('aarch64')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('w3m')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'pepper-flash: flash support'
    'google-chrome: Widevine DRM Plugin'
    'vivaldi-widevine: Widevine DRM Plugin'
    'libnotify: native notifications'
)
provides=('www-browser' 'vivaldi')
source=("https://downloads.vivaldi.com/stable/vivaldi-stable_${_pkgver}_arm64.deb")
sha512sums=('7b8d3c5f373d05e70fbfe29750f6a7c684450beead9ef54b33758f8847f4bb3f736f323becdbf90fc24917caefb9087f6ece1b1ef7c013fc0480f1224eb05269')

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/$_pkgname/vivaldi-sandbox"

    # make /usr/bin/vivaldi-stable available
    binf="$pkgdir/usr/bin/vivaldi-stable"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/vivaldi/vivaldi "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/$_pkgname/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$_pkgname.png"
    done

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
    strings "$pkgdir/opt/vivaldi/locales/en-US.pak" \
        | tr '\n' ' ' \
        | sed -rne 's/.*(<html lang.*>.*html>).*/\1/p' \
        | w3m -I 'utf-8' -T 'text/html' \
        > "$pkgdir/usr/share/licenses/$_pkgname/eula.txt"
}
