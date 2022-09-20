# Maintainer: Atahan Acar <atahan at acar dot pw>
# pkgbuild based on https://github.com/Kyuunex/hid-sony-clone-fix-dkms

_pkgbase='hid-sony-panic-fix'
pkgname=${_pkgbase}-dkms
pkgver=5.19.8
pkgrel=1
pkgdesc="A quick hack to the hid-sony driver meant for the third party / clone DS4 controllers that do not support HID feature report 0x81. Also fixes a possible divide by zero on some clone controllers"
_srctag=v${pkgver}
license=('GPL2')
arch=('x86_64')
depends=('dkms')
source=("hid-sony.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/hid/hid-sony.c?h=${_srctag}"
        "hid-ids.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/hid/hid-ids.h?h=${_srctag}"
        "Makefile"
        "hid-sony-panic-fix-dkms.dkms"
        "hid-sony-blacklist.modprobe")
sha256sums=('d06b36d69f723777a4cba2fcae34523002e39a9549e2e67136e520627f1a173f'
            '788bfdc38373898038b62e75f6a939105105843fcf0409fe39d0f2ea490f1642'
            '72ee83c2a199afb5e30e8a6fb71c73667d86845284c2b6ca760e9d7b7b6a65d6'
            '04a25acef8059630188ebbf398115c87bf27f97a8e37ce9a10d1d30387800610'
            'f4ab0b6941e353e861007a0bb6c468b4a7d027c56d530056fa686ad837616635')

prepare(){
    local workdir="${srcdir}/workdir"
    mkdir -p "${workdir}"
    cp "${srcdir}/hid-sony.c" "${workdir}"
    patch -d "${workdir}" -Np3 -i "${srcdir}/../hid-sony-panic-fix.patch"
}

package() {
    local dest="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -d "${dest}"
    install -m 644 -T "${srcdir}/workdir/hid-sony.c" "${dest}/${_pkgbase}.c"
    install -m 644 -T "${srcdir}/hid-ids.h" "${dest}/hid-ids.h"
    install -m 644 -T "${srcdir}/Makefile" "${dest}/Makefile"
    install -m 644 -T "${srcdir}/hid-sony-panic-fix-dkms.dkms" "${dest}/dkms.conf"

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Blacklist the original hid_sony module
    install -dm755 "${pkgdir}/usr/lib/modprobe.d"
    install -Dm644 "${srcdir}/hid-sony-blacklist.modprobe" "${pkgdir}/usr/lib/modprobe.d/hid-sony-blacklist.conf"
}
