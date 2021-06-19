# Maintainer: Feakster <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail dot com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>

### Info ###
pkgname=vivaldi-arm-bin
_pkgname=${pkgname%-arm-bin}
pkgver=4.0.2312.33
pkgrel=1
_pkgrel=1
pkgdesc='An advanced browser made with the power user in mind'
arch=('armv6h' 'armv7h' 'aarch64')
url="https://vivaldi.com"
license=('custom:Vivaldi EULA')
provides=('vivaldi' 'www-browser')
depends=('alsa-lib' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libxss' 'nss' 'shared-mime-info' 'ttf-font')
optdepends=(
    'libnotify: native notifications'
)
options=('!emptydirs' '!strip')
install='update-ffmpeg.install'
_source_armhf=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_armhf.deb")
source_armv6h=("$_source_armhf")
source_armv7h=("$_source_armhf")
source_aarch64=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${_pkgrel}_arm64.deb")
b2sums_armv6h=('63a3420e89d75ca1491eae66c4a7927e64d631fa45b3b5016f161c7730d75886872c54e0d9c6bbdaaed1a3ac0d1632b32ee62785f3f45da1d20ce6740bf096f3')
b2sums_armv7h=('63a3420e89d75ca1491eae66c4a7927e64d631fa45b3b5016f161c7730d75886872c54e0d9c6bbdaaed1a3ac0d1632b32ee62785f3f45da1d20ce6740bf096f3')
b2sums_aarch64=('8161941f9ab7dd427f9b117f51d60b84b16c6114ae6fadcf016d4dd87f0002a5f33eafb613e5c31cf97fdbdc00b5665a8f8226fd6232a4396fce5fd53ff58a3d')

### Prepare ###
prepare() {
    ## Extract Internals ##
    tar -xf data.tar.xz
}

### Package ###
package() {
    ## Copy Directory Structure ##
    cp --parents -a {opt,usr} "$pkgdir"

    ## SUID Sandbox ##
    chmod 4755 "$pkgdir"/opt/$_pkgname/${_pkgname}-sandbox

    ## Icons ##
    for res in 16 22 24 32 48 64 128 256; do
        install -dm0755 "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/apps
        ln -fs \
        /opt/$_pkgname/product_logo_${res}.png \
        "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/apps/$_pkgname.png
    done

    ## License ##
    install -dm0755 "$pkgdir"/usr/share/licenses/$_pkgname
    ln -fs \
    /opt/$_pkgname/LICENSE.html \
    "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE.html

    ## Remove Debian/Widevine Directories/Files ##
    rm -rf "$pkgdir"/opt/$_pkgname/{cron,update-widevine,WidevineCdm}
}
