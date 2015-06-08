# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=dvb-usb-af9035
pkgver=1
pkgrel=4
pkgdesc="TerraTec Cinergy T Stick USB DVB-T kernel module"
arch=('i686' 'x86_64')
url="http://linuxtv.org/wiki/index.php/TerraTec_Cinergy_T_Stick"
license=('GPL')
makedepends=('linux-headers>=3.2' 'linux-headers<3.3')
depends=('linux>=3.2' 'linux<3.3')
source=(
    "http://mennucc1.debian.net/terratec_af9035-a_m.tar.gz"
    "${pkgname}-linux32.patch"
)
md5sums=(
    '472caeed389c4dc57f3f545dc9e47967'
    'f48b1838a9cd57878f1196f8eed0a76b'
)
install="${pkgname}.install"

_xtardir='terratec_af9035-a_m'
_extramodules='extramodules-3.2-ARCH'
_kernver="$(cat /lib/modules/${_extramodules}/version)"

build() {
    cd "${srcdir}/${_xtardir}"

    msg "Patching Makefile for kernel ${_kernver} ..."

    sed -i "s,\(^KDIR =\).*,\1 /lib/modules/${_kernver}/build," "Makefile"
    sed -i "s,\(^KSRC =\).*,\1 /lib/modules/${_kernver}/build," "Makefile"
    sed -i "s,\(^KINSTALL =\).*,\1 ${pkgdir}/lib/modules/${_extramodules}," "Makefile"
    sed -i "/^install/ a\\\tinstall -D -m 644 dvb-usb-af9035-01.fw ${pkgdir}/lib/firmware/dvb-usb-af9035-01.fw" "Makefile"
    sed -i '/^install/ a\\tinstall -d $(KINSTALL)' "Makefile"
    sed -i '/depmod/ d' "Makefile"

    msg "Patching frontend ..."

    patch -Np1 -i "${srcdir}/${pkgname}-linux32.patch"

    msg "Starting make ..."

    make
}

package() {
    cd "${srcdir}/${_xtardir}"

    make install

    gzip "${pkgdir}/lib/modules/${_extramodules}"/*.ko

    sed -i "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${install}"
}
