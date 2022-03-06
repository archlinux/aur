# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=mqttx-bin
_pkgname=${pkgname%-bin}
pkgver=1.7.3
pkgrel=1
pkgdesc="A cross-platform MQTT 5.0 client tool open sourced by EMQ"
arch=('x86_64')
url="https://github.com/emqx/MQTTX"
license=('Apache')
depends=('electron5')
makedepends=('squashfs-tools')
source=(${_pkgname^^}-${pkgver}.snap::"https://github.com/emqx/MQTTX/releases/download/v${pkgver}/${_pkgname^^}_${pkgver}_amd64.snap"
        "${_pkgname}.sh")
sha256sums=('7270b6f12334d0c926bf6f847f04f8b6d6b3ce0ffe8adf74d9d6d32e8d1d4b0f'
            '8712e2ac7ea0b3c8fd7ec7664516cf03a6e61a51377f32aba0cbf750af4f6b0d')

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
