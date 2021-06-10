# Maintainer: Feakster <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail dot com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>

### Info ###
pkgname=vivaldi-arm-bin
_pkgname=${pkgname%-arm-bin}
pkgver=4.0.2312.24
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
b2sums_armv6h=('62b8bd8939d1ca0beb948658af6fa8b8ed74c09f27130051e258657cc52d7c835814798a6ed370ce9171b42b0e01b389135d463cf8b2be8b27af2f3c863f526e')
b2sums_armv7h=('62b8bd8939d1ca0beb948658af6fa8b8ed74c09f27130051e258657cc52d7c835814798a6ed370ce9171b42b0e01b389135d463cf8b2be8b27af2f3c863f526e')
b2sums_aarch64=('f6a139eb5204553a21bfbc54fe6fd1faff74f5cf8ebabdcdfb8a18d9324ef489cfd1b74f0b76d7ee08884885b2cccea97c32eb2d6871cde3b5b03242f7b39ba8')

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
