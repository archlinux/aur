# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi/

pkgname=vivaldi-rpi
_pkgname=vivaldi
pkgver=3.0.1874.38
_pkgver=3.0.1874.38-1
pkgrel=2
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
options=('!strip' '!emptydirs')
license=('custom')
arch=('armv6h' 'armv7h' 'aarch64')
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
source=("https://downloads.vivaldi.com/stable/vivaldi-stable_${_pkgver}_armhf.deb")
sha512sums=('79c4d99ee79fa31944c4a22e077c94f0c6b75a0c844b8b78734a5dd91f9c5a686f0eb546e2c83be010e552c7590f318ccfa67911e82dacfd05f573a9078c7b50')

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
        install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
    done

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
    strings "$pkgdir/opt/vivaldi/locales/en-US.pak" \
        | tr '\n' ' ' \
        | sed -rne 's/.*(<html lang.*>.*html>).*/\1/p' \
        | w3m -I 'utf-8' -T 'text/html' \
        > "$pkgdir/usr/share/licenses/$_pkgname/eula.txt"
}
