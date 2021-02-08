# Maintainer: Benjamin Feakins <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail dot com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi/

pkgname=vivaldi-arm-bin
_pkgname=vivaldi
pkgver=3.6.2165.36
pkgrel=1
_pkgrel=1
pkgdesc='An advanced browser made with the power user in mind'
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
_source_armhf=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_armhf.deb")
source_armv6h=("$_source_armhf")
source_armv7h=("$_source_armhf")
source_aarch64=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_arm64.deb")
b2sums_armv6h=('e814f57cd530024a4a179764814c6bb73c6a876c5b98f9f117fa74d49f3157c95e980dd82529059c8e455cb47da3c56c8d311af820391b30891992807993a534')
b2sums_armv7h=('e814f57cd530024a4a179764814c6bb73c6a876c5b98f9f117fa74d49f3157c95e980dd82529059c8e455cb47da3c56c8d311af820391b30891992807993a534')
b2sums_aarch64=('b95b4bc62639c46add743a2f8d66edbd2e6981bff3de7d7f3828ea82efe3295350a3eabb96a4a2cf41b45156c9b64f64b067208f73ca30c70dd716f5aebce12c')

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
