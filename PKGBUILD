# Maintainer: Evine Deng <evinedeng@hotmail.com>

_pkgname=iventoy
pkgname=${_pkgname}-bin
pkgver=1.0.19
pkgrel=1
pkgdesc="An enhanced version of the PXE server. 一个增强版的 PXE 服务器。"
arch=("x86_64")
url="https://www.iventoy.com"
license=("custom")
provides=('iventoy')
depends=('bash' 'coreutils' 'glibc')
install="${_pkgname}.install"
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/ventoy/PXE/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-free.tar.gz"
        "iventoy"
        "iventoy.service"
        "iventoy.tmpfiles")
sha256sums=('c624dc593f17a118131fbc6490a00ce05809ed9e498dd85bc8d2338ffa214328'
            'ef27beecddc5a9650194e8b033ae0b3172f29a9bf352cfff079a61ece86a3263'
            'cd5565f2c67ea128604a44074fc3e6a1b741abbc47525af5d7671404e9854e18'
            '65131e0002958dbfc831375c1f31d7aa10c38ee8f1f39f945ae91b1becc69a47')
options=(!strip)

package() {
    cd "${srcdir}/${_pkgname}-$pkgver"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" doc/*
    install -Dm644 -t "${pkgdir}/opt/${_pkgname}/data" data/*
    install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/scripts" user/scripts/example/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib/lin64" lib/lin64/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib" lib/iventoy
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}" iventoy.sh
    sed -i 's|#! /bin/bash|#!/bin/bash|' "${pkgdir}/opt/${_pkgname}/iventoy.sh"
    mkdir -p "${pkgdir}/opt/${_pkgname}"/{user/scripts,log/history}

    cd "${srcdir}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
}
