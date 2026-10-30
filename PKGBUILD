# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=iventoy
pkgname="${_pkgname}-bin"
pkgver=1.0.49
pkgrel=1
pkgdesc="An enhanced version of the PXE server"
arch=("x86_64" "aarch64")
url="https://www.iventoy.com"
license=("custom:END USER LICENSE AGREEMENT (EULA) FOR IVENTOY PROFESSIONAL/FREE EDITION")
install="${_pkgname}.install"
provides=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}.sh"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ventoy/PXE/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64-free.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/ventoy/PXE/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64-trial.tar.gz")
sha256sums=('ef27beecddc5a9650194e8b033ae0b3172f29a9bf352cfff079a61ece86a3263'
            '7d0c73aa37f35ec8b8ab2b32ba415b3efed0e1f1a677f64f64349f102d173562'
            '4f2180dc7afdeebf062bc6cbf8186c652394196cd264608a314a196c4ece809c')
sha256sums_x86_64=('5f7983b9c8139c55812ad5a75e9f5b72dda53fd201546cbbc6455b9df0a0f342')
sha256sums_aarch64=('6d46714f2119b72bbbad184e88543de0769e5ae8109cc3db06f3381cfff59650')
options=(!strip)

prepare() {
    # Since 1.0.46 the release tarball unpacks into the unversioned
    # top-level directory "iventoy" instead of "iventoy-${pkgver}".
    sed -i 's|#! /bin/bash|#!/bin/bash|' "${_pkgname}/${_pkgname}.sh"
}

package() {
    install -Dm755 "${_pkgname}.sh"       "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_pkgname}"
    # doc/ also contains the scripts/ subdirectory since 1.0.46, so only the
    # licence files (doc/*.txt) are installed here.
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" doc/*.txt
    install -Dm644 -t "${pkgdir}/opt/${_pkgname}/data"           data/*
    # The example auto-install scripts moved from user/scripts/example to
    # doc/scripts/example in 1.0.46.
    install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/scripts"  doc/scripts/example/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib/lin64"      lib/lin64/*
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/lib"            "lib/${_pkgname}" lib/update.sh
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}"                "${_pkgname}.sh"
    # version.txt is new in 1.0.46 and is read by lib/update.sh (get_version).
    install -Dm644 -t "${pkgdir}/opt/${_pkgname}"                version.txt

    ln -s "/var/lib/${_pkgname}/config.dat" "${pkgdir}/opt/${_pkgname}/data/config.dat"
    ln -s "/var/lib/${_pkgname}/iso"        "${pkgdir}/opt/${_pkgname}/iso"
    ln -s "/var/lib/${_pkgname}/user"       "${pkgdir}/opt/${_pkgname}/user"
    ln -s "/var/log/${_pkgname}"            "${pkgdir}/opt/${_pkgname}/log"
}
