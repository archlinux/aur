# Maintainer: Feakster <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail dot com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>

### Info ###
pkgname=vivaldi-arm-bin
_pkgname=${pkgname%-arm-bin}
pkgver=3.7.2218.52
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
b2sums_armv6h=('a962c17cdfd8140b36255aaebc1d501e3107bd9f75e6cce1663c13465a5fc1072a1331ba9fd3588d5d26742bf6abf43d741df5dc3b51fe7230f8c6436c6659ed')
b2sums_armv7h=('a962c17cdfd8140b36255aaebc1d501e3107bd9f75e6cce1663c13465a5fc1072a1331ba9fd3588d5d26742bf6abf43d741df5dc3b51fe7230f8c6436c6659ed')
b2sums_aarch64=('5ac89302b2f4db14bcf96b2b6b176b7f3a07e896d35be16bf038b1dfd7354113489e9f8f9b46f5767cedff530c013a2e1d3743547d4b2c01bc31e09e22bef4fd')

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
