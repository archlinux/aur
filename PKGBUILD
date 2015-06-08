# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>
# Contributor: graysky <graysky AT archlinux DOT org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=broadcom-wl-uksm-ck
pkgver=6.30.223.248
pkgrel=11
_pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver for linux-uksm-ck.'
_extramodules="extramodules-4.0-uksm-ck"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
pkgdesc="${_pkgdesc}"
arch=('i686' 'x86_64')
url='http://www.broadcom.com/support/802.11/linux_sta.php'
license=('custom')
depends=('linux-uksm-ck>=4.0' 'linux-uksm-ck<4.1')
makedepends=('linux-uksm-ck-headers>=4.0' 'linux-uksm-ck-headers<4.1')
[[ $CARCH = x86_64 ]] && _arch=_64 || _arch=
source=("http://www.broadcom.com/docs/linux_sta/hybrid-v35${_arch}-nodebug-pcoem-${pkgver//./_}.tar.gz"
        'modprobe.d'
        'license.patch'
        'linux-recent.patch'
        'gcc.patch')
sha256sums=('3d994cc6c05198f4b6f07a213ac1e9e45a45159899e6c4a7feca5e6c395c3022'
            'b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32'
            '2f70be509aac743bec2cc3a19377be311a60a1c0e4a70ddd63ea89fae5df08ac'
            'f651681496316ac60b5f2d37c93a36b3a4a1ee29ab6aada6eebaef7f7c1f1d02'
            'b07ce80f2e079cce08c8ec006dda091f6f73f158c8a62df5bac2fbabb6989849')
[[ $CARCH = x86_64 ]] && sha256sums[0]='3d994cc6c05198f4b6f07a213ac1e9e45a45159899e6c4a7feca5e6c395c3022'
install=${pkgname}.install

prepare() {
    patch -p1 -i linux-recent.patch
    patch -p1 -i license.patch
    patch -p1 -i gcc.patch

    sed -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" \
        -i src/wl/sys/wl_linux.c
}


build() {
    make -C /usr/lib/modules/"${_kernver}"/build M=`pwd`
}

package() {
    install -Dm644 wl.ko "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"
    # makepkg does not do this automatically for this pkg so do it here
    gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"
    install -Dm644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 modprobe.d "${pkgdir}/usr/lib/modprobe.d/broadcom-wl_uksm-ck.conf"
}
