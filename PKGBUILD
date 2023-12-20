# Maintainer: Evine Deng <evinedeng@hotmail.com>

# 由于 iventoy 本身的设计，只能以root用户运行。
# Due to the design of iventoy itself, it can only run as root user.

_pkgname=iventoy
pkgname=${_pkgname}-bin
pkgver=1.0.19
pkgrel=2
pkgdesc="An enhanced version of the PXE server | 一个增强版的 PXE 服务器"
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
            '2f4bf44eb5efb78cce2a8d6f98469803f918a7b1d64b4cfec7d68f055a19e90b'
            '9d9378926284a0f2f2591bda744aff752e90de6b77b9b80bb2e5aa2e81173c61')
options=(!strip)  # If strip, it will not start.

prepare() {
    sed -i 's|#! /bin/bash|#!/bin/bash|' "${srcdir}/${_pkgname}-$pkgver/iventoy.sh"
}

package() {
    cd "${srcdir}/${_pkgname}-$pkgver"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" doc/*
    install -Dm644 -t "${pkgdir}/opt/${_pkgname}/data" data/*
    install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/scripts" user/scripts/example/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib/lin64" lib/lin64/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib" lib/iventoy
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}" iventoy.sh
    ln -s /var/lib/iventoy/config.dat "${pkgdir}/opt/${_pkgname}/data/config.dat"
    ln -s /var/lib/iventoy/iso "${pkgdir}/opt/${_pkgname}/iso"
    ln -s /var/log/iventoy "${pkgdir}/opt/${_pkgname}/log"

    cd "${srcdir}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
