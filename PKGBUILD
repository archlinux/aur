# Maintainer: Marc ROZANC <marc@rozanc.fr>

_pkgbase='clevo-xsm-wmi'
_modname=$_pkgbase
pkgname="${_pkgbase}-dkms"
pkgver='0.8'
_pkgtag='ac1cf19e290b'
pkgrel=4
pkgdesc='A reverse engineering driver for the Clevo SM series backlight keyboard (DKMS version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/lynthium/clevo-xsm-wmi'
options=(!emptydirs)
conflicts=("$_pkgbase" 'tuxedo-wmi' 'tuxedo-wmi-dkms')
provides=("$_pkgbase")
depends=('dkms' 'gcc' 'make' 'linux-headers' 'linux')
source=("clevo-xsm-wmi-${pkgver}.src.tar.gz::https://bitbucket.org/lynthium/clevo-xsm-wmi/get/v${pkgver}.tar.gz"
        "dkms.conf"
        "Makefile")
sha256sums=('0948133273d088a8610cac85d06287022cc847da7570d6d9d3f1f906352d569c'
            '0cdf0213692a71d69f54730d1856d9f1e7b3d363d9b2a66a5d6bb363e8d8212f'
            'fb20847bde676a305fda41b865b46aff52ae9de60e1262d6e9725a71d72b806b')
install='clevo-xsm-wmi-dkms.install'
_linux_major_version=$(pacman -Q linux | cut -d' ' -f 2 | sed -r 's/^([0-9]+\.[0-9]+).+$/\1/')
_extramodules="extramodules-${_linux_major_version}-ARCH"

package() {
    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/module"

    # Copy sources (including Makefile)
    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    install -Dm644 "${srcdir}/Makefile" "${srcdir}/dkms.conf" "clevo-xsm-wmi.c" "${pkgdir}/usr/src/${_modname}-${pkgver}/"

    # Copy license
    install -Dm644 "/usr/share/licenses/common/GPL2/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Module loading
    install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
    echo "clevo-xsm-wmi" > "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

