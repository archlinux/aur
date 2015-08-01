# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jarda-wien <xstej70@gmail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Atilla ÖNTAŞ <tarakbumba@gmail.com>

pkgname=nvidia-dkms
pkgver=352.30
pkgrel=1
pkgdesc='NVIDIA kernel module sources (DKMS)'
arch=('i686' 'x86_64')
url='http://www.nvidia.com/'
license=('custom')
depends=('dkms' "nvidia-utils=${pkgver}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
provides=('nvidia')
conflicts=('nvidia')
install='nvidia-dkms.install'
source=()
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums_i686=('563eb858584f3eec38f137055039cd4addc7bb4c8f47f90e87a0cc1f88db32e3')
sha256sums_x86_64=('0f7acc89b2392c71cc8713b0291606052e0cd8971ee951901dde37387d85efc0')

[[ $CARCH == i686 ]] && _pkg=NVIDIA-Linux-x86-${pkgver}
[[ $CARCH == x86_64 ]] && _pkg=NVIDIA-Linux-x86_64-${pkgver}-no-compat32

prepare() {
  if [[ -d ${_pkg} ]] ; then
    rm -rf ${_pkg}
  fi

  sh ${_pkg}.run --extract-only

  cd ${_pkg}

  if [[ $CARCH == x86_64 ]]; then
    cat kernel/uvm/dkms.conf.fragment >> kernel/dkms.conf
  fi
}

package() {
  cd ${_pkg}

  install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,share/licenses,src}
  cp -dr --no-preserve='ownership' kernel "${pkgdir}"/usr/src/nvidia-${pkgver}

  echo 'blacklist nouveau' > "${pkgdir}"/usr/lib/modprobe.d/nvidia.conf

  ln -s nvidia "${pkgdir}"/usr/share/licenses/nvidia-dkms
}

# vim: ts=2 sw=2 et:
