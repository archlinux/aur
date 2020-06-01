# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>
#
pkgname="trello"
pkgver="0.1.9"
pkgrel="3"
pkgdesc="Unofficial Trello Desktop app"
arch=('any')
url="https://github.com/danielchatfield/trello-desktop"
license=('MIT')
depends=('electron')
makedepends=('yarn')
conflicts=('trello-bin' 'trello-git')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

sha256sums=('8c028ee831b2deddb7b35e368540832f05d58ae9904730d0c1200ec5096cf8f2')

_trello="#!/bin/bash
exec electron --app=/usr/lib/trello \"\$@\""

_trello_desktop="[Desktop Entry]
Name=Trello
Exec=trello
Terminal=false
Type=Application
Icon=trello
Categories=Network;"

prepare() {
    cd "${srcdir}"
    echo -e "$_trello" | tee trello
    echo -e "$_trello_desktop" | tee trello.desktop
}

build() {
    cd "${srcdir}"/${pkgname}-desktop-${pkgver}
    yarn install --prod
}

package() {
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/lib
    install -Dm644 ${pkgname}-desktop-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 ${pkgname}-desktop-${pkgver}/static/Icon.png "${pkgdir}"/usr/share/pixmaps/trello.png

    rm -rf ${pkgname}-desktop-${pkgver}/{media,LICENSE}
    mv ${pkgname}-desktop-${pkgver} "${pkgdir}"/usr/lib/trello

    install -Dm755 trello "${pkgdir}"/usr/bin/trello
    install -Dm644 trello.desktop "${pkgdir}"/usr/share/applications/trello.desktop
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
