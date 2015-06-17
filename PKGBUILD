# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jarda-wien <xstej70@gmail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Atilla ÖNTAŞ <tarakbumba@gmail.com>

pkgname=nvidia-dkms
pkgver=352.21
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
sha256sums_i686=('616382a5f47e62c8f35509ce684a6ebc94e4a62c51208a11c5976517123040d0')
sha256sums_x86_64=('cfccf25135bf5c33f68eb892e341b35126f6561f257b32893ccd055d624964eb')

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
