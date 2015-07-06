# Author: Christoph Jaeger <christophjaeger AT linux DOT com>
# Maintainer: Marc Rozanc <marc AT rozanc DOT fr>

pkgname="tuxedo-wmi"
pkgver="1.5.1"
pkgrel=2
pkgdesc='A reverse engineering driver for the Clevo P15SM/P17SM/P150SM/P157SM/P170SM/P177SM backlight keyboard, by Christoph Jaeger'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26&s=82130b57e71bd5b6ea569abc1424025c6f8d412d'
makedepends=('linux-headers')
replaces=("clevo-wmi")
conflicts=("clevo_wmi-git" "clevo-wmi-dkms" "clevo-wmi" "clevo-wmi-dkms" "tuxedo-wmi-dkms")
source=("tuxedo-wmi-${pkgver}.src.tar.gz::http://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=424&h=3df4c21145314ceaeadd7986662b2a5b01d1094f&s=5196669c65535d86e616f839936c42a5166a40a0")
md5sums=('c5bf0f815f394baf4fabe2c78d9483cc')
install='tuxedo-wmi.install'

build() {
    cd "${srcdir}/tuxedo-wmi-${pkgver}/src"
    make
}

package() {
    cd "${srcdir}/tuxedo-wmi-${pkgver}/src"
    
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
                install -m644 tuxedo-wmi.ko "${pkgdir}/usr/lib/modules/${_moduledirs}/"
                gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/tuxedo-wmi.ko"
            fi
        done
    done
}
