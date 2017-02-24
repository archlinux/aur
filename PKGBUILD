# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch-git
pkgver=v0.8
pkgrel=3
pkgdesc='kernel module allowing to switch dedicated graphics card on Optimus laptops (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://github.com/Bumblebee-Project/bbswitch'
provides=('bbswitch')
conflicts=('bbswitch' 'bbswitch-dkms' 'bbswitch-git-dkms')
makedepends=('linux-headers' 'git')
source=("${pkgname}::git+https://github.com/Bumblebee-Project/bbswitch.git#branch=develop")
sha256sums=('SKIP')
install=bbswitch.install

pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd ${srcdir}/${pkgname}

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
        install -m644 bbswitch.ko "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/bbswitch.ko"
      fi
    done
  done
}
