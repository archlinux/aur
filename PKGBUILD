# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=dvb-usb-af9035-lts
pkgver=1
pkgrel=2
pkgdesc="TerraTec Cinergy T Stick USB DVB-T kernel module for linux-lts"
arch=('i686' 'x86_64')
url="http://linuxtv.org/wiki/index.php/TerraTec_Cinergy_T_Stick"
license=('GPL')
makedepends=('linux-lts-headers')
depends=('linux-lts')
source=(
    "http://mennucc1.debian.net/terratec_af9035-a_m.tar.gz"
)
md5sums=(
    '472caeed389c4dc57f3f545dc9e47967'
)
install="${pkgname}.install"

_xtardir='terratec_af9035-a_m'
_extramodules='extramodules-3.0-lts'
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
    cd "${srcdir}/${_xtardir}"

    msg "Patching Makefile for kernel ${_kernver} ..."

    sed -i "s,\(^KDIR =\).*,\1 /usr/lib/modules/${_kernver}/build," "Makefile"
    sed -i "s,\(^KSRC =\).*,\1 /usr/lib/modules/${_kernver}/build," "Makefile"
    sed -i "s,\(^KINSTALL =\).*,\1 ${pkgdir}/usr/lib/modules/${_extramodules}," "Makefile"
    sed -i "/^install/ a\\\tinstall -D -m 644 dvb-usb-af9035-01.fw ${pkgdir}/usr/lib/firmware/dvb-usb-af9035-01.fw" "Makefile"
    sed -i '/^install/ a\\tinstall -d $(KINSTALL)' "Makefile"
    sed -i '/depmod/ d' "Makefile"

    msg "Starting make ..."

    make
}

package() {
    cd "${srcdir}/${_xtardir}"

    make install

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}"/*.ko

    sed -i "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${install}"
}
