# Maintainer: Feakster <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail dot com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>

### Info ###
pkgname=vivaldi-arm-bin
_pkgname=${pkgname%-arm-bin}
pkgver=4.0.2312.27
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
b2sums_armv6h=('7d77d47ea4b25df635f85f7a0407ad106e605f5bfbc02605d80deccb0af3cb65f68ebd499e85be85bc4835ab788665b4a5791a6a4e457359b079d9a3706015e1')
b2sums_armv7h=('7d77d47ea4b25df635f85f7a0407ad106e605f5bfbc02605d80deccb0af3cb65f68ebd499e85be85bc4835ab788665b4a5791a6a4e457359b079d9a3706015e1')
b2sums_aarch64=('02c80f783548639f9514f8c0b3c2979b3e1752d6d4ff5363b148173ba4023ca83acf5492307b3ea55cea8dddf0f8a241ceb51f1474aa083824007edc6853439c')

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
