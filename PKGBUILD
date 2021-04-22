# Maintainer: Feakster <feakster at posteo dot eu>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Matthew Zilvar <mattzilvar at gmail dot com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>

### Info ###
pkgname=vivaldi-arm-bin
_pkgname=${pkgname%-arm-bin}
pkgver=3.7.2218.58
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
b2sums_armv6h=('a85b97405c80dd10907d9b0b9846b8c2b1101346cdce4b19ddeb1192de64c49056e086903829b30b9e6bb4928c3de500138cda460596dff7c2505fae0661d6ca')
b2sums_armv7h=('a85b97405c80dd10907d9b0b9846b8c2b1101346cdce4b19ddeb1192de64c49056e086903829b30b9e6bb4928c3de500138cda460596dff7c2505fae0661d6ca')
b2sums_aarch64=('8f0dd3e845f2e4587d238c8f48447e514ac7605acab8d67f30c30ce2df04fae600382218087aea68f75621887f5a71506389c81f9b31614e20d3d7611d7bfe0e')

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
