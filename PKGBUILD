# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jarda-wien <xstej70@gmail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Atilla ÖNTAŞ <tarakbumba@gmail.com>

# NOTE: THIS IS JUST nvidia-dkms for the 346xx series
# https://aur.archlinux.org/packages/nvidia-dkms/

pkgname=nvidia-346xx-dkms
pkgver=346.59
pkgrel=1
pkgdesc='NVIDIA kernel module sources (DKMS) 346 Series'
arch=('i686' 'x86_64')
url='http://www.nvidia.com/'
license=('custom')
depends=('dkms' "nvidia-346xx-utils")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
provides=('nvidia' 'nvidia-dkms')
conflicts=('nvidia' 'nvidia-dkms')
install='nvidia-dkms.install'
source=('linux3.18.patch')

source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('63a52af60e2ee36a2efa41022780802de7eec5b315aa1580a2fa1eb208d8fa87')
sha256sums_i686=('65cf83fccc02399d54212cbeea1c2364e4974687c3ad6cba87cc109476ad2129')
sha256sums_x86_64=('4c7941e9248a931b720f050c38822708aa8176c4464fc40d02e1c7dd7ebbe767')

[[ $CARCH == i686 ]] && _pkg=NVIDIA-Linux-x86-${pkgver}
[[ $CARCH == x86_64 ]] && _pkg=NVIDIA-Linux-x86_64-${pkgver}-no-compat32

prepare() {
  if [[ -d ${_pkg} ]] ; then
    rm -rf ${_pkg}
  fi

  sh ${_pkg}.run --extract-only

  cd ${_pkg}

  patch -Np0 -i ../linux3.18.patch

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
