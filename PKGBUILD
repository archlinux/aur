# Maintainer: sukanka <su975853527@gmail.com>
pkgname=bbswitch-ati-git
pkgver=0.8.4.g07b110d
pkgrel=1
pkgdesc='kernel module allowing to switch also AMD integrated and Nvidia dedicated graphics card on Optimus laptops (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://github.com/Bumblebee-Project/bbswitch'
provides=('bbswitch')
conflicts=('bbswitch' 'bbswitch-dkms' 'bbswitch-git-dkms')
makedepends=('linux-headers' 'git')
source=("${pkgname}::git+https://github.com/Bumblebee-Project/bbswitch.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g' | sed 's/v//g'
}

build() {
    kernel_ver=$(cut -f1 -d'-' /usr/src/linux/version)
    cpu=$( grep name /proc/cpuinfo  | uniq | cut -f2 -d: | cut -f2 -d' ')
    cd "${srcdir}/${pkgname}"
    if [ "$cpu" = "AMD" ]; then
        sed -i 's/PCI_VENDOR_ID_INTEL/PCI_VENDOR_ID_ATI/g' "${srcdir}/${pkgname}"/bbswitch.c
    fi
    make KDIR=/usr/src/linux
}

package() {
    cd ${srcdir}/${pkgname}
    _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    install -Dt "${pkgdir}${_extradir}" -m644 *.ko
    find "${pkgdir}" -name '*.ko' -exec xz {} +
}
 
