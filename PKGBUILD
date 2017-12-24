# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgbase='exanic'
pkgname=("${pkgbase}"
         "${pkgbase}-dkms")
pkgdesc="Drivers and software for ExaNIC, a low latency network card from Exablaze."
pkgver='2.0.1'
pkgrel=1
arch=('x86_64')
url='http://www.exablaze.com/'
license=('GPL2')
depends=("linux-lts" "linux-lts-headers" "libnl")
makedepends=("linux-lts-headers")
options=('libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("${pkgbase}::git+https://github.com/exablaze-oss/exanic-software.git#commit=bf547d173c9d8e28de6c39a9841390402888d4d0")
sha256sums=('SKIP')

if [[ -z "$_kernelver" ]]; then
    #_kernelver="$(uname -r)"                                      # running
    #_kernelver="$(cat /lib/modules/extramodules-4.4-lts/version)" # installed
    _kernelver="$(pacman -Q linux-lts | cut -d' ' -f2)-lts"        # installed
fi

prepare() {
    cd "${srcdir}/${pkgbase}"
    sed -e 's/#MODULE_VERSION#/'"${pkgver}-${pkgrel}"'/g' \
        -e 's/extra/extramodules/g' \
        "${srcdir}/${pkgbase}/debian/${pkgbase}-dkms.dkms" \
        > "${srcdir}/dkms.conf"
    #patch -p1 < "${srcdir}/exanic-archlinux.patch"
}

build() {
    cd "${srcdir}/${pkgbase}"
    make -C "${srcdir}/${pkgbase}" clean-bin
    make -C "${srcdir}/${pkgbase}" bin
}

#check() {
#    cd "${srcdir}/${pkgbase}"
#}

_package() {
    make -C "${srcdir}/${pkgbase}" install-bin \
        PREFIX=/usr \
        DESTDIR="${pkgdir}/" \
        INCDIR="${pkgdir}/usr/include" \
        DEVLIBDIR="${pkgdir}/usr/lib"
}

_package-dkms() {
    pkgdesc="Linux network drivers for the ExaNIC."
    depends=("dkms" "linux-lts-headers")
    _dkmsdir="${pkgdir}/usr/src/${pkgbase}-${pkgver}"

    mkdir -p "${_dkmsdir}/libs/"{exanic,exasock/kernel}
    cp -r "${srcdir}/${pkgbase}/modules" \
          "${_dkmsdir}/"
    cp \
       "${srcdir}/${pkgbase}/libs/exanic/"{ioctl.h,pcie_if.h,fifo_if.h,const.h} \
       "${_dkmsdir}/libs/exanic/"
    cp \
       "${srcdir}/${pkgbase}/libs/exasock/kernel/"{api,structs,consts}.h \
       "${_dkmsdir}/libs/exasock/kernel/"

    install -D -m0644 \
        "${srcdir}/dkms.conf" \
        "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
}

for _p in ${pkgname[@]}; do
    eval "package_${_p}() {
        $(declare -f "_package${_p#${pkgbase}}")
        _package${_p#${pkgbase}}
    }"
done

