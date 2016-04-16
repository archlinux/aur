# Maintainer: Christoph Haag <haagch+aur@frickel.club>
# Author: Christoph Jaeger <christophjaeger@linux.com>
# Contributor: Marc Rozanc <marc@rozanc.fr>

pkgname="clevo-wmi-dkms-git"
_modname="clevo-wmi"
pkgver="0.9.6"
pkgrel=4
pkgdesc='A reverse engineered driver for the Clevo P15SM/P17SM/P170EM/W230ST/W350STQ/W370ST/W650SR/W670SR/W740SU backlight keyboard'
arch=('any')
license=('GPL')
url='https://github.com/franontanaya/clevo-wmi/tree/master/code-dump/clevo-wmi-code-b5d8a0d3f9cb4f20b39018d25ba9f313ad1b10ba' #I actually don't know where this version is from
depends=('dkms' 'linux-headers')
provides=("clevo-wmi")
conflicts=("clevo_wmi-git" "clevo-wmi" "tuxedo-wmi" "tuxedo-wmi-dkms")
source=("git+https://github.com/ChristophHaag/clevo-wmi.git"
        "dkms.conf.in")
md5sums=('SKIP'
         '885768a16582199937509d456b3475af')
install='clevo-wmi-dkms.install'

_driverdir=clevo-wmi/code-dump/clevo-wmi-code-b5d8a0d3f9cb4f20b39018d25ba9f313ad1b10ba

#_driverdir=clevo-wmi/src 				#this one doesn't actually controlling the leds
#_driverdir=clevo-wmi/code-dump/clevo-wmi-0.9.6/src
#_driverdir=clevo-wmi/code-dump/clevo-wmi		#clevo_wmi: Invalid function: 0x56 - and doesn't do anything
#_driverdir=clevo-wmi/code-dump/clevo_laptop_1.1.1	#doesn't build

build() {
    cd "${srcdir}/$_driverdir"
    make
}

package() {
    cd "${srcdir}/$_driverdir"

    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    for i in "${srcdir}/$_driverdir/"{Makefile,clevo-wmi.c}; do
        install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    done
    sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}

