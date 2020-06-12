# Maintainer: sukanka <su975853527@gmail.com>
pkgbase=bbswitch-ati-git
pkgname=(bbswitch-ati-git bbswitch-ati-dkms-git)
pkgver=0.8.5.gddbd243
pkgrel=1
pkgdesc='kernel module allowing to switch also AMD integrated and Nvidia dedicated graphics card on Optimus laptops (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://github.com/Bumblebee-Project/bbswitch'
provides=('bbswitch')
conflicts=('bbswitch' 'bbswitch-dkms' 'bbswitch-dkms-git' 'bbswitch-git')
makedepends=('linux-headers' 'git')
source=("${pkgbase}::git+https://github.com/Bumblebee-Project/bbswitch.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  git describe --always | sed 's|-|.|g' | sed 's/v//g'
}

build() {
    kernel_ver=$(cut -f1 -d'-' /usr/src/linux/version)
    cpu=$( grep name /proc/cpuinfo  | uniq | cut -f2 -d: | cut -f2 -d' ')
    cd "${srcdir}/${pkgbase}"
    if [ "$cpu" = "AMD" ]; then
        sed -i 's/PCI_VENDOR_ID_INTEL/PCI_VENDOR_ID_ATI/g' "${srcdir}/${pkgbase}"/bbswitch.c
    fi
    make KDIR=/usr/src/linux
}

package_bbswitch-ati-git() {
    cd ${srcdir}/${pkgbase}
    _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    install -Dt "${pkgdir}${_extradir}" -m644 *.ko
    find "${pkgdir}" -name '*.ko' -exec xz {} +
}
 
package_bbswitch-ati-dkms-git() {
    depends=('dkms')
    cd ${srcdir}/${pkgbase}
    install -Dt "${pkgdir}/usr/src/${pkgbase}" -m644 Makefile bbswitch.c dkms/dkms.conf
}
