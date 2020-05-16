# Maintainer: sukanka <su975853527@gmail.com>


pkgname=bbswitch-ati-git
pkgver=0.8.2.g9dd2270
pkgrel=2
pkgdesc='kernel module allowing to switch also AMD integrated and Nvidia dedicated graphics card on Optimus laptops (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://github.com/Bumblebee-Project/bbswitch'
provides=('bbswitch')
conflicts=('bbswitch' 'bbswitch-dkms' 'bbswitch-git-dkms')
makedepends=('linux-headers' 'git')
source=("${pkgname}::git+https://github.com/Bumblebee-Project/bbswitch.git#branch=develop"
'bbswitch-v0.8-proc_ops-struct.patch'
)
sha256sums=('SKIP' '3ebaf305628587fce64f64648f8ee6c1bc51e0eab855e1725538be995649a73c')

pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g' | sed 's/v//g'
}

build() {
    kernel_ver=$(cut -f1 -d'-' /usr/src/linux/version)
    cpu=$( grep name /proc/cpuinfo  | uniq | cut -f2 -d: | cut -f2 -d' ')
    cd "${srcdir}/${pkgname}"
    if [ $kernel_ver > "5.6" ]; then 
        git apply "${srcdir}"/bbswitch-v0.8-proc_ops-struct.patch
    fi
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
 
