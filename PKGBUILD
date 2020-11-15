# Maintainer: Benjamin Feakins <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail dot com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi/

pkgname=vivaldi-arm-bin
_pkgname=vivaldi
pkgver=3.4.2066.106
pkgrel=1
_pkgrel=1
pkgdesc='An advanced browser made with the power user in mind.'
arch=('armv6h' 'armv7h' 'aarch64')
url="https://vivaldi.com"
license=('custom')
provides=('vivaldi' 'www-browser')
replaces=('vivaldi-arm64' 'vivaldi-rpi')
depends=('alsa-lib' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libxss' 'nss' 'shared-mime-info' 'ttf-font')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'pepper-flash: flash support'
    'libnotify: native notifications'
)
makedepends=('w3m')
options=('!emptydirs' '!strip')
source_armhf=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_armhf.deb")
source_armv6h=("$source_armhf")
source_armv7h=("$source_armhf")
source_aarch64=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_arm64.deb")
b2sums_armv6h=('5ee874dc41c484aa2130ca20a1a68b48178f7a55db1c56c010b4319448aada2c0c4e0b2d7ab36dd85d37cf4f789e25ec57679a3b6ea87c086e537025ab56199f')
b2sums_armv7h=('5ee874dc41c484aa2130ca20a1a68b48178f7a55db1c56c010b4319448aada2c0c4e0b2d7ab36dd85d37cf4f789e25ec57679a3b6ea87c086e537025ab56199f')
b2sums_aarch64=('90677ffe9f7b76a45a686dc1953c4eccb956a438c1c5afccf8e7af2fbdf3a22b5446fb4932c309c57ada545af2844f45a4c4fb3ec9c5731c7fe6ca29ba96aa27')

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
