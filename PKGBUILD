# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_module=broadcom-wl
_kernelname=-mainline-anbox-git      # Build against kernel with a different name
pkgname=${_module}${_kernelname}
pkgver=6.30.223.271
pkgrel=374
pkgdesc='Broadcom 802.11 Linux STA wireless driver for the linux-mainline-anbox-git kernel'
arch=('x86_64')
url='https://www.broadcom.com/support/download-search/?pf=Wireless+LAN+Infrastructure'
license=('custom')
makedepends=("linux${_kernelname}-headers" "${_module}-dkms=${pkgver}")

build() {
    _kernver=$(</usr/src/linux$(echo $_kernelname | cut -d\- -f-3)/version)

    fakeroot dkms build --dkmstree "${srcdir}" -m ${_module}/${pkgver} -k ${_kernver}
}

package() {
    depends=("linux${_kernelname}")

    _kernver=$(</usr/src/linux$(echo $_kernelname | cut -d\- -f-3)/version)
    _extramodules="/usr/lib/modules/${_kernver}/extramodules"

    install -Dm644 -t "${pkgdir}${_extramodules}" \
        ${_module}/${pkgver}/${_kernver}/${CARCH}/module/*

    # compress kernel modules
    find "$pkgdir" -name "*.ko" -exec xz {} +

    _license="/usr/share/licenses/${_module}-dkms"
    if [[ -d ${_license} ]]; then
        install -Dm644 -t "${pkgdir}"/${_license/-dkms/${_kernelname}} ${_license}/*
    fi
    _modprobe="/usr/lib/modprobe.d/${_module}-dkms.conf"
    if [[ -r ${_modprobe} ]]; then
        install -Dm644 ${_modprobe} "${pkgdir}"/${_modprobe/-dkms/${_kernelname}}
    fi
}

