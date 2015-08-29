# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jarda-wien <xstej70@gmail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Atilla ÖNTAŞ <tarakbumba@gmail.com>

pkgname=nvidia-dkms
pkgver=352.41
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
sha256sums_i686=('b3fc5af7bb2852305272ffb3d5d73fbfba639d6a2af9e34a007dde3c6133f6e3')
sha256sums_x86_64=('a67cca72f7de2b5a8d822001b5a78012373989a97388fe9eff56a75e6cad30cd')

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
