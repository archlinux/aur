# Maintainer: Arnoud Willemsen <mail@lynthium.com>

# Build utility as well? defaults to yes. Leave empty for no
_buildutil=y

if [ -n "$_buildutil" ]; then
	pkgname=('clevo-xsm-wmi'
         'clevo-xsm-wmi-utility')
else
	pkgname=('clevo-xsm-wmi')
fi
pkgver='0.4'
_pkgtag='ea6d0253b59f'
pkgrel=1
pkgdesc='A reverse engineering driver for the Clevo SM series backlight keyboard.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/lynthium/clevo-xsm-wmi'
source=("clevo-xsm-wmi-${pkgver}.src.tar.gz::https://bitbucket.org/lynthium/clevo-xsm-wmi/get/v${pkgver}.tar.gz")
options=(!emptydirs)
makedepends=('linux-headers')

build() {
    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/module"
    make

    if [ -n "$_buildutil" ]; then
	    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/utility"
	    qmake && make
    fi
}

package_clevo-xsm-wmi() {
	install='clevo-xsm-wmi.install'
    depends=''

    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/module"

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
if [ -n "$_buildutil" ]; then
	package_clevo-xsm-wmi-utility() {
        depends=('qt5-base')

	    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/utility"

	    install -Dm755 clevo-xsm-wmi ${pkgdir}/usr/bin/clevo-xsm-wmi
	    install -Dm755 systemd/clevo-xsm-wmi.service ${pkgdir}/usr/lib/systemd/system/clevo-xsm-wmi.service
	    install -D -m644 /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	}
fi
md5sums=('9a9b35fcf80113cf0b4a551bbf73ea59')
