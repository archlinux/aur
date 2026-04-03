# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=iventoy
pkgname="${_pkgname}-bin"
pkgver=1.0.24
pkgrel=1
pkgdesc="An enhanced version of the PXE server"
arch=("x86_64")
url="https://www.iventoy.com"
license=("custom")
provides=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ventoy/PXE/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-free.tar.gz"
        "${_pkgname}"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles")
sha256sums=('862007cbc28e442a257f71bb924ba5d264a8d4247c4ed1ab8d03ebcebab17e43'
            'ef27beecddc5a9650194e8b033ae0b3172f29a9bf352cfff079a61ece86a3263'
            '7d0c73aa37f35ec8b8ab2b32ba415b3efed0e1f1a677f64f64349f102d173562'
            '84436ca3719486543f522ac771618b6c10d92c13be7e649776a631af87844e14')
options=(!strip)

prepare() {
    sed -i 's|#! /bin/bash|#!/bin/bash|' "${_pkgname}-${pkgver}/${_pkgname}.sh"
}

package() {
    install -Dm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_pkgname}-${pkgver}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" doc/*
    install -Dm644 -t "${pkgdir}/opt/${_pkgname}/data"           data/*
    install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/scripts"  user/scripts/example/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib/lin64"      lib/lin64/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib"            "lib/${_pkgname}"
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}"                "${_pkgname}.sh"

    ln -s "/var/lib/${_pkgname}/config.dat" "${pkgdir}/opt/${_pkgname}/data/config.dat"
    ln -s "/var/lib/${_pkgname}/iso"        "${pkgdir}/opt/${_pkgname}/iso"
    ln -s "/var/log/${_pkgname}"            "${pkgdir}/opt/${_pkgname}/log"
}
