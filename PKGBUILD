# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch
pkgver=0.5
pkgrel=2
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
provides=('bbswitch')
conflicts=('dkms-bbswitch' 'dkms-bbswitch-git')
makedepends=('linux-headers')
install=bbswitch.install
source=("https://github.com/downloads/Bumblebee-Project/bbswitch/${pkgname}-${pkgver}.tar.gz")


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  sed -i "s|/lib/modules|/usr/lib/modules|g" Makefile
   
  for _kernver in $_KERNELS; do
    msg2 "Building module for $_kernver..."

    # KDIR is necessary even when cleaning
    make KDIR=/usr/src/linux-${_kernver} clean
    make KDIR=/usr/src/linux-${_kernver}
  done
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
   
   # Find all extramodules directories
  _EXTRAMODULES=`find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||'`

  # Loop through all detected kernels
  for _kernver in $_KERNELS; do 
    
    # Loop through all detected extramodules directories
    for _moduledirs in $_EXTRAMODULES; do
      # Check which extramodules directory corresponds with the built module
      if [ `cat "/usr/lib/modules/${_moduledirs}/version"` = $_kernver ]; then
        mkdir -p "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        install -m644 bbswitch.ko "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/bbswitch.ko"                      
      fi
    done
  done 
}

md5sums=('5e0e6eb9c5e8c10db56e5b349b43bba7')
