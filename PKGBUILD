# Maintainer: Scott Shumate <scott(at)shumatech(dot)com>

_pkgbase='hid-sony-ds3usb'
pkgname=${_pkgbase}-dkms
pkgver=5.6.13
pkgrel=1
pkgdesc="The hid_sony kernel module with a patch to fix buttons on Sony DualShock 3 USB adapters"
_srctag=v${pkgver}-arch1
url='https://www.spinics.net/lists/linux-input/msg67472.html'
license=('GPL2')
arch=('x86_64')
depends=('dkms')
source=("hid-sony.c::https://git.archlinux.org/linux.git/plain/drivers/hid/hid-sony.c?h=${_srctag}"
        "hid-ids.h::https://git.archlinux.org/linux.git/plain/drivers/hid/hid-ids.h?h=${_srctag}"
        "Makefile"
        "hid-sony-ds3usb.patch"
        "hid-sony-ds3usb-dkms.dkms"
        "hid-sony-blacklist.modprobe")
sha256sums=('509b6d7d4fc33fdaa4efd971de93965e6864f50dc6fb8aa89ae67a36f75fc845'
            '162932261317e712cc344f5947af96c0bdff33adacade895e2e694df87330121'
            '96cab0ae36a9d7a8ab01aa7d5a20890981f7f5836328b1d35eaf54ec6bb6b208'
            '089fbfb629f77cbe71bf424ce79e59dd3c851ca90404935d5983608f26eede12'
            '04a25acef8059630188ebbf398115c87bf27f97a8e37ce9a10d1d30387800610'
            'f4ab0b6941e353e861007a0bb6c468b4a7d027c56d530056fa686ad837616635')

prepare(){
    local workdir="${srcdir}/workdir"
    mkdir -p "${workdir}"
    cp "${srcdir}/hid-sony.c" "${workdir}"
    patch -d "${workdir}" -Np3 -i "${srcdir}/hid-sony-ds3usb.patch"
}

package() {
    local dest="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -d "${dest}"
    install -m 644 -T "${srcdir}/workdir/hid-sony.c" "${dest}/${_pkgbase}.c"
    install -m 644 -T "${srcdir}/hid-ids.h" "${dest}/hid-ids.h"
    install -m 644 -T "${srcdir}/Makefile" "${dest}/Makefile"
    install -m 644 -T "${srcdir}/hid-sony-ds3usb-dkms.dkms" "${dest}/dkms.conf"

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Blacklist the original hid_sony module
    install -dm755 "${pkgdir}/usr/lib/modprobe.d"
    install -Dm644 "${srcdir}/hid-sony-blacklist.modprobe" "${pkgdir}/usr/lib/modprobe.d/hid-sony-blacklist.conf"
}
