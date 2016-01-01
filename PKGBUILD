# Maintainer: Marc ROZANC <marc@rozanc.fr>

_modname='clevo-xsm-wmi'
pkgname="${_modname}-dkms"
pkgver='0.8'
_pkgtag='ac1cf19e290b'
pkgrel=1
pkgdesc='A reverse engineering driver for the Clevo SM series backlight keyboard (DKMS version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/lynthium/clevo-xsm-wmi'
source=("clevo-xsm-wmi-${pkgver}.src.tar.gz::https://bitbucket.org/lynthium/clevo-xsm-wmi/get/v${pkgver}.tar.gz"
        "dkms.conf.in")
options=(!emptydirs)
conflicts=("$_modname" 'tuxedo-wmi' 'tuxedo-wmi-dkms')
provides=("$_modname")
depends=('dkms' 'linux-headers')
sha256sums=('0948133273d088a8610cac85d06287022cc847da7570d6d9d3f1f906352d569c'
            'b6877cbd6abfb5ea24079ad740b985478ddd385062a02a45a7bce493576993de')
install='clevo-xsm-wmi-dkms.install'

build() {
    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/module"
    make
}

package() {
    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/module"

    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    
    for i in "${srcdir}/lynthium-${_modname}-${_pkgtag}/module/"{Makefile,clevo-xsm-wmi.c}; do
        install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    done
    sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf" 

    install -D -m644 /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

