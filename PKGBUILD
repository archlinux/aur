# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=mqttx-bin
_pkgname=${pkgname%-bin}
pkgver=1.9.9
pkgrel=1
pkgdesc="A cross-platform MQTT 5.0 client tool open sourced by EMQ"
arch=('x86_64')
url="https://github.com/emqx/MQTTX"
license=('Apache')
depends=('electron13')
makedepends=('squashfs-tools')
source=(${_pkgname^^}-${pkgver}.snap::"https://github.com/emqx/MQTTX/releases/download/v${pkgver}/${_pkgname^^}_${pkgver}_amd64.snap"
        "${_pkgname}.sh")
sha256sums=('8d7ff5e581dafd57542a54ef439eeb3d0d9a7175924030dfab05da017849e740'
            '735d91b5f674b830d761a56fdef8e577077e9738e92143e75394acdecf38cba1')

prepare() {
  unsquashfs -f ${_pkgname^^}-${pkgver}.snap /resources/app.asar \
                                           /meta/gui/icon.png \
                                           /meta/gui/${_pkgname}.desktop
}

package() {
  # app.asar
  install -Dm644 squashfs-root/resources/app.asar -t ${pkgdir}/usr/share/${_pkgname}
  # electron wrapper
  install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
  # icon
  install -Dm644 squashfs-root/meta/gui/icon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  # desktop entry
  install -Dm644 squashfs-root/meta/gui/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  sed -i 's|${SNAP}/meta/gui/icon.png|mqttx|g' ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}

# vim: set sw=2 ts=2 et:
