# Maintainer: Anish Bhatt anish [at] gatech [dot] edu
# Contributor: JuanLu Guti <jlu85@ono.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jarda-wien <xstej70@gmail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Atilla ÖNTAŞ <tarakbumba@gmail.com>

pkgname=nvidia-340xx-dkms
pkgver=340.76
pkgrel=4
pkgdesc='NVIDIA kernel module sources (DKMS)'
arch=('i686' 'x86_64')
url='http://www.nvidia.com/'
license=('custom')
depends=('dkms' "nvidia-340xx-utils>=${pkgver}")
optdepends=('linux-headers: Build the module against Arch kernel'
            'linux-lts-headers: Build the module against LTS Arch kernel')
provides=("nvidia=${pkgver}" "nvidia-dkms")
conflicts=('nvidia-340xx' 'nvidia-dkms')
install="${pkgname}.install"
source=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha1sums=('1335af174324f5c752388110e65c3c51beea729b'
          '2df59750d9fdeed613e84379108fb2bec67afd14')
[[ $CARCH == i686 ]] && _pkg=NVIDIA-Linux-x86-${pkgver}
[[ $CARCH == x86_64 ]] && _pkg=NVIDIA-Linux-x86_64-${pkgver}-no-compat32

prepare() {
  if [[ -d ${_pkg} ]] ; then
    rm -rf ${_pkg}
  fi

  sh ${_pkg}.run --extract-only
}

package() {
  cd ${_pkg}

  install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,share/licenses,src}
  cp -dr --no-preserve='ownership' kernel "${pkgdir}"/usr/src/nvidia-${pkgver}

# Blacklist nouveau
  echo "blacklist nouveau" > "${pkgdir}"/usr/lib/modprobe.d/nvidia.conf

# UVM module
  cat "${pkgdir}"/usr/src/nvidia-${pkgver}/uvm/dkms.conf.fragment >> "${pkgdir}"/usr/src/nvidia-${pkgver}/dkms.conf

# License
  ln -s nvidia "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
