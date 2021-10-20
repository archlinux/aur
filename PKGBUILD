# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=stairspeedtest
pkgname=${_pkgname}-reborn-bin
pkgver=0.7.1
pkgrel=4
pkgdesc="Proxy performance batch tester based on Shadowsocks(R) and V2Ray"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/tindy2013/${_pkgname}-reborn"
license=('MIT')
depends=('bash')
provides=('stairspeedtest')
conflicts=('stairspeedtest')
options=(!strip)
source=(${_pkgname}-webgui.service
        ${_pkgname}-webserver.service)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_reborn_linux64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_reborn_armhf.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_reborn_arm64.tar.gz")
sha256sums=('d1e7fdf0317c3a621232f046d543706f98aae26b7ed87be7b59bb5c9a4d3858e'
            '0c3ab114616693a7ea6ad0abefec4f6c5b1da6c44735b16a3ea0809467f49900')
sha256sums_x86_64=('236f328f7dbeaa1a63e59aa62c9ee8fdda30ebfdc6379edf5e1f8f191a120c6c')
sha256sums_armv7h=('7e854bc19b23d9e4352ce6cf724a356eb5ebe310ebda1ba2c2d7f48e9b489a54')
sha256sums_aarch64=('8b9398f01eb5c8ef5b28b237754cbf94cbc26123fb6b481aa3ea1599a26e1253')

prepare() {
  cd "${srcdir}/${_pkgname}"
  cat > stairspeedtest.sh << "EOF"
#!/bin/bash
pushd "$(dirname "$(readlink -f "${0}")")"
./stairspeedtest
popd
EOF
  chmod 755 stairspeedtest.sh
}

package() {
  cd "${pkgdir}"
  
  mkdir -pv ./opt/
  cp -rf ${srcdir}/${_pkgname} ./opt
  chmod +x ./opt/${_pkgname}/{stairspeedtest,webgui.sh,webserver.sh}
  chmod +x ./opt/${_pkgname}/tools/clients/*
  chmod +x ./opt/${_pkgname}/tools/gui/websocketd
  
  mkdir -pv ./usr/lib/systemd/system/
  install -Dm644 "${srcdir}"/${_pkgname}-webgui.service  ./usr/lib/systemd/system/${_pkgname}-webgui.service
  install -Dm644 "${srcdir}"/${_pkgname}-webserver.service  ./usr/lib/systemd/system/${_pkgname}-webserver.service
  
  mkdir -pv ./usr/bin
  ln -vsf /opt/${_pkgname}/stairspeedtest.sh ./usr/bin/stairspeedtest
}
