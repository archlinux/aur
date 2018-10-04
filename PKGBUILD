# Maintainer: Fabio Heday <fheday@gmail.com>

pkgname=nvhda-dkms-git
_pkgbase=nvhda
pkgver=r10.3e13d2e
pkgrel=1
pkgdesc="Kernel driver to dynamically enable/disable NVIDIA HDMI audio output in optimus laptops"
arch=(i686 x86_64)
url="https://github.com/hhfeuer/nvhda.git"
license=(GPL)
optdepends=('nvidia: NVIDIA kernel driver'
            ' nvidia-390xx: NVIDIA kernel driver for old devices')
makedepends=(cmake gcc linux-headers)
source=("git+https://github.com/hhfeuer/nvhda.git")
md5sums=('SKIP')

pkgver() {
  cd nvhda
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd nvhda
  make
}

package() {
  _KVERSION=`uname -r`
  cd nvhda
  mkdir -p "${pkgdir}/usr/lib/modules/$_KVERSION/misc/nvhda/"
  install -m644  nvhda.ko "${pkgdir}/usr/lib/modules/$_KVERSION/misc/nvhda/"
    
  # Copy dkms.conf
  install -Dm644 dkms/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  # Copy dkms.conf
  install -Dm644 dkms/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/#MODULE_VERSION#/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp Makefile nvhda.c "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  #install systemd units
      install -Dm644 "scripts/nvhda-resume.service" "${pkgdir}/usr/lib/systemd/system/nvhda-resume.service"
      install -Dm644 "scripts/nvhda-suspend.service" "${pkgdir}/usr/lib/systemd/system/nvhda-suspend.service"

}

