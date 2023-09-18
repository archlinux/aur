# Maintainer : Bjoern Bidar - AUR+me@thaodan.de
     
pkgname=nvidia-pf
pkgver=535.104.05
pkgrel=1
pkgdesc="NVIDIA drivers for linux-pf."
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("linux-pf-headers" "nvidia-dkms=$pkgver")
depends=("linux-pf" "nvidia-utils=${pkgver}" "libglvnd")
conflicts=( 'nvidia-96xx' 'nvidia-173xx' 'nvidia-pf-core2' 'nvidia-pf-k8'
  'nvidia-pf-atom' 'nvidia-pf-psc' 'nvidia-pf-p4' 'nvidia-pf-p3'
 'nvidia-pf-pm' 'nvidia-pf-k7')
provides=('NVIDIA-MODULE')
license=('custom')
options=(!strip)

build() {
  _kernver="$(</usr/src/linux-pf/version)"
  fakeroot dkms build --dkmstree "${srcdir}" -m nvidia/${pkgver} -k ${_kernver}
}


package() {
  _kernver="$(</usr/src/linux-pf/version)"

  install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/extramodules" -m644 nvidia/${pkgver}/${_kernver}/${CARCH}/module/*

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec xz -T1 {} +

  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-pf.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

