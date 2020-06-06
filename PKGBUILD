# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="deemixgui"
pkgver="0.0.7"
pkgrel="1"
pkgdesc="A minimal Electron application that loads the deemix site."
arch=('any')
url="https://notabug.org/lollilol/deemixgui"
license=('GPL3')
depends=('electron' 'zlib')
makedepends=('yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/master.tar.gz")

sha256sums=('1ff8feb4c6e44b408ece66f2c456ed54d7a1ba7c826237b2abb503d6fc5c0479')

_deemixgui="#!/bin/bash
exec electron --app=/usr/lib/deemixgui \"\$@\""

_deemixgui_desktop="[Desktop Entry]
Name=Deemixgui
Exec=deemixgui
Terminal=false
Type=Application
Icon=deemix
Categories=Network;AudioVideo;Audio;Player;"

prepare() {
    cd "${srcdir}"
    echo -e "$_deemixgui" | tee deemixgui.bash
    echo -e "$_deemixgui_desktop" | tee deemixgui.desktop
}

build() {
    cd "${srcdir}"/${pkgname}
    yarn install --prod
}

package() {
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/lib
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 ${pkgname}/img/deemix.png "${pkgdir}"/usr/share/pixmaps/deemix.png

    rm -rf ${pkgname}/{server-darwin,server-windows.exe,LICENSE}
    mv ${pkgname} "${pkgdir}"/usr/lib/deemixgui

    install -Dm755 deemixgui.bash "${pkgdir}"/usr/bin/deemixgui
    install -Dm644 deemixgui.desktop "${pkgdir}"/usr/share/applications/deemixgui.desktop
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
