# Maintainer: Benjamin Feakins <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail.com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi/

pkgname=vivaldi-arm-bin
_pkgname=vivaldi
pkgver=3.4.2066.94
pkgrel=2
_pkgrel=1
pkgdesc='An advanced browser made with the power user in mind.'
arch=('armv6h' 'armv7h' 'aarch64')
url="https://vivaldi.com"
license=('custom')
provides=('www-browser' 'vivaldi-stable')
conflicts=('vivaldi')
replaces=('vivaldi-rpi' 'vivaldi-arm64')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'pepper-flash: flash support'
    'libnotify: native notifications'
)
makedepends=('w3m')
options=('!strip' '!emptydirs')
source_armhf=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_armhf.deb")
source_armv6h=("$source_armhf")
source_armv7h=("$source_armhf")
source_aarch64=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_arm64.deb")
b2sums_armv6h=('cb5cbb4e9dc739832eb177a58e5074ba0b09cfbb46c20fc2cd592c7b094da20ab9865f14ed56e549fbde1e0d2f1f1a8aa863de86a17fccd4fc38b63e04853e57')
b2sums_armv7h=('cb5cbb4e9dc739832eb177a58e5074ba0b09cfbb46c20fc2cd592c7b094da20ab9865f14ed56e549fbde1e0d2f1f1a8aa863de86a17fccd4fc38b63e04853e57')
b2sums_aarch64=('a1390f9ca072134ce422205bfc2ed3cdc3f0ba6b9fd151525fe2976884e075dd84f1f6a646840c998cadebd575aadfd7d2f64d3c912f10683e33d819b02525c3')

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
