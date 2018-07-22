# Maintainer: Marc ROZANC <marc@rozanc.fr>

_pkgbase='clevo-xsm-wmi'
_modname=$_pkgbase
pkgname="${_pkgbase}-dkms"
pkgver='1.1'
_pkgtag='dcf282992eb8'
pkgrel=7
pkgdesc='A reverse engineering driver for the Clevo SM series backlight keyboard (DKMS version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi'
options=(!emptydirs)
conflicts=("$_pkgbase" 'tuxedo-wmi' 'tuxedo-wmi-dkms')
provides=("$_pkgbase")
depends=('dkms' 'gcc' 'make' 'linux-headers')
source=("clevo-xsm-wmi-${_pkgtag}.src.tar.gz::https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi/get/${_pkgtag}.tar.gz"
        "P950ER.patch"
        "dkms.conf"
        "Makefile")
sha256sums=('dd326e9855b708b7ab922d47b3abcd24c53a3af4fdc1c164399c8dbdb5a7f6ce'
            'ccd1a9277c055b702eb05662484c0c6b0e62f6fae255030d3a30975984b0c427'
            '0cdf0213692a71d69f54730d1856d9f1e7b3d363d9b2a66a5d6bb363e8d8212f'
            'fb20847bde676a305fda41b865b46aff52ae9de60e1262d6e9725a71d72b806b')
install='clevo-xsm-wmi-dkms.install'

prepare() {
    cd "${srcdir}/tuxedocomputers-clevo-xsm-wmi-${_pkgtag}"
    patch -i "${srcdir}/P950ER.patch" -p1
}

package() {
    cd "${srcdir}/tuxedocomputers-clevo-xsm-wmi-${_pkgtag}/module"

    # Copy sources (including Makefile)
    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    install -Dm644 "${srcdir}/Makefile" "${srcdir}/dkms.conf" "clevo-xsm-wmi.c" "${pkgdir}/usr/src/${_modname}-${pkgver}/"

    # Copy license
    install -Dm644 "/usr/share/licenses/common/GPL2/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Module loading
    install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
    echo "clevo-xsm-wmi" > "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
