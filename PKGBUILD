# Maintainer: Arnoud Willemsen <mail@lynthium.com>

pkgname='clevo-xsm-wmi'
pkgver='1.1'
_pkgtag='6bfe9fe44e04'
pkgrel=3
pkgdesc='A reverse engineering driver for the Clevo laptop models backlight keyboard.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi'
source=("clevo-xsm-wmi-${pkgver}.src.tar.gz::https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi/get/v${pkgver}.tar.gz"
        "clevo-xsm-wmi.patch")
sha256sums=('630ff6dbfa90c8a9285badf75b60579b2a9495e85862b62ef77a3654535e4b72'
            '7324fb7426daea15270ff584a35681d63499c8087cddfc6958f458c806bbc094')
options=(!emptydirs)
makedepends=('linux-headers')
install='clevo-xsm-wmi.install'

prepare() {
    cd "${srcdir}/tuxedocomputers-clevo-xsm-wmi-${_pkgtag}"
    patch -i "${srcdir}/clevo-xsm-wmi.patch" -p1
}

build() {
    cd "${srcdir}/tuxedocomputers-clevo-xsm-wmi-${_pkgtag}/module"
    make
}

package() {
    cd "${srcdir}/tuxedocomputers-clevo-xsm-wmi-${_pkgtag}/module"

    _PACKAGES=`pacman -Qsq linux`
    _KERNELS=`pacman -Ql $_packages | grep /modules.alias.bin | sed 's/.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`

    # Find all extramodules directories
    _EXTRAMODULES=`find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||'`

    # Loop through all detected kernels
    for _kernver in $_KERNELS; do
        # Loop through all detected extramodules directories
        for _moduledirs in $_EXTRAMODULES; do
            # Check which extramodules directory corresponds with the built module
            if [ `cat "/usr/lib/modules/${_moduledirs}/version"` = $_kernver ]; then
                mkdir -p "${pkgdir}/usr/lib/modules/${_moduledirs}/"
                install -m644 clevo-xsm-wmi.ko "${pkgdir}/usr/lib/modules/${_moduledirs}/"
                gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/clevo-xsm-wmi.ko"
            fi
        done
    done

    install -D -m644 /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "${pkgdir}/etc/modules-load.d"
    echo "clevo-xsm-wmi" > "${pkgdir}/etc/modules-load.d/clevo-xsm-wmi.conf"
}
