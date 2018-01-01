# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

_pkgbase='exanic'
_suffix='' # '-git'
pkgbase="${_pkgbase}${_suffix}"
pkgname=("${_pkgbase}${_suffix}"
         "${_pkgbase}-dkms${_suffix}")
pkgdesc="Drivers and software for ExaNIC, a low latency network card from Exablaze."
pkgver=2.0.1
pkgrel=1
arch=('x86_64')
url='http://www.exablaze.com/'
license=('GPL2')
depends=("linux-lts" "linux-lts-headers" "libnl")
makedepends=("linux-lts-headers")
options=('libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("${_pkgbase}::git+https://github.com/exablaze-oss/exanic-software.git#commit=bf547d173c9d8e28de6c39a9841390402888d4d0")
sha256sums=('SKIP')

if [[ -z "$_kernelver" ]]; then
    #_kernelver="$(uname -r)"                                      # running
    #_kernelver="$(cat /lib/modules/extramodules-4.4-lts/version)" # installed
    _kernelver="$(pacman -Q linux-lts | cut -d' ' -f2)-lts"        # installed
fi

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    DRV_VERSION="$(grep '#define DRV_VERSION' "${srcdir}/${_pkgbase}/modules/exanic/exanic.h" | cut -d\" -f2)"
    printf "%s" "${DRV_VERSION%%-git}"
#    printf "%s.r%s.g%s" \
#        "${DRV_VERSION%%-git}" \
#        "$(git rev-list --count HEAD)" \
#        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgbase}"
    #DRV_VERSION="$(grep DRV_VERSION "${srcdir}/${_pkgbase}/modules/exanic/exanic.h" | cut -d\" -f2)"
    #sed -e 's/#MODULE_VERSION#/'"${DRV_VERSION}-${pkgrel}"'/g' \
    sed -e 's/#MODULE_VERSION#/'"${pkgver}-${pkgrel}"'/g' \
        -e 's/extra/extramodules/g' \
        "${srcdir}/${_pkgbase}/debian/${_pkgbase}-dkms.dkms" \
        > "${srcdir}/dkms.conf"
    #patch -p1 < "${srcdir}/exanic-archlinux.patch"
}

build() {
    cd "${srcdir}/${_pkgbase}"
    make -C "${srcdir}/${_pkgbase}" clean-bin
    make -C "${srcdir}/${_pkgbase}" bin
}

#check() {
#    cd "${srcdir}/${_pkgbase}"
#}

package_exanic() {
    depends+=("${_pkgbase}-dkms${_suffix}")
    make -C "${srcdir}/${_pkgbase}" install-bin \
        PREFIX=/usr \
        DESTDIR="${pkgdir}/" \
        INCDIR="${pkgdir}/usr/include" \
        DEVLIBDIR="${pkgdir}/usr/lib"
}

package_exanic-dkms() {
    pkgdesc="Linux network drivers for the ExaNIC."
    depends=("dkms" "linux-lts-headers")
    _dkmsdir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

    mkdir -p "${_dkmsdir}/libs/"{exanic,exasock/kernel}
    cp -r "${srcdir}/${_pkgbase}/modules" \
          "${_dkmsdir}/"
    cp \
       "${srcdir}/${_pkgbase}/libs/exanic/"{ioctl.h,pcie_if.h,fifo_if.h,const.h} \
       "${_dkmsdir}/libs/exanic/"
    cp \
       "${srcdir}/${_pkgbase}/libs/exasock/kernel/"{api,structs,consts}.h \
       "${_dkmsdir}/libs/exasock/kernel/"

    install -D -m0644 \
        "${srcdir}/dkms.conf" \
        "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}

