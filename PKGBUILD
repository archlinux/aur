# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=iventoy
pkgname="${_pkgname}-bin"
pkgver=1.0.26
pkgrel=1
pkgdesc="An enhanced version of the PXE server"
arch=("x86_64")
url="https://www.iventoy.com"
license=("custom")
provides=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ventoy/PXE/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-free.tar.gz"
        "${_pkgname}.sh"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles")
sha256sums=('07ff09c930c79b0e4e4824c09b7e2a6219498777b6be287ef4dbac806f287daf'
            'ef27beecddc5a9650194e8b033ae0b3172f29a9bf352cfff079a61ece86a3263'
            '7d0c73aa37f35ec8b8ab2b32ba415b3efed0e1f1a677f64f64349f102d173562'
            '4f2180dc7afdeebf062bc6cbf8186c652394196cd264608a314a196c4ece809c')
options=(!strip)

prepare() {
    sed -i 's|#! /bin/bash|#!/bin/bash|' "${_pkgname}-${pkgver}/${_pkgname}.sh"
}

package() {
    install -Dm755 "${_pkgname}.sh"       "${pkgdir}/usr/bin/${_pkgname}"
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
    ln -s "/var/lib/${_pkgname}/user"       "${pkgdir}/opt/${_pkgname}/user"
    ln -s "/var/log/${_pkgname}"            "${pkgdir}/opt/${_pkgname}/log"
}
