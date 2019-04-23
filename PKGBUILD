# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>>
#
_pkgname="tweetdeck"
pkgname="${_pkgname}"-desktop
pkgver="1.0.0"
pkgrel="1"
pkgdesc="An unofficial tweetdeck desktop app"
url="https://github.com/mikebell/tweetdeck-desktop"
arch=('x86_64')
license=('MIT')
depends=('electron')
makedepends=('yarn')
provides=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e33823086d8cb2bc8f7027bcf1b8d6f3bec3d7a054dd81e386c69721b1386dee')

_tweetdeck="#!/bin/bash
exec electron --app=/usr/lib/tweetdeck \"\$@\""

_tweetdeck_desktop="[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Tweetdeck
Comment=Desktop version of Tweetdeck
Exec=tweetdeck
Terminal=false
Type=Application
Icon=tweetdeck
Categories=Network;"

prepare() {
	cd "${srcdir}"
    echo -e "$_tweetdeck" | tee ${_pkgname}
    echo -e "$_tweetdeck_desktop" | tee ${_pkgname}.desktop
}

build(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install --prod
}

package() {
	cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/lib
    install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${pkgname}-${pkgver}/static/Icon.png "${pkgdir}"/usr/share/pixmaps/${_pkgname}.png
    rm -rf ${pkgname}-${pkgver}/{static,media,LICENSE}
    mv ${pkgname}-${pkgver} "${pkgdir}"/usr/lib/${_pkgname}
    install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
	install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
