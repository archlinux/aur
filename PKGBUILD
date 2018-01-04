# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-340xx-ck
pkgver=340.104
_extramodules=extramodules-4.14-ck
pkgrel=13
pkgdesc="NVIDIA drivers for linux-ck, 340xx legacy branch."
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.14' 'linux-ck<4.15' 'libgl' "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.14' 'linux-ck-headers<4.15' 'nvidia-340xx-libgl')
conflicts=('nvidia-ck' 'nvidia-304xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
'kernel-4.11.patch'
'kernel-4.14.patch'
)
sha256sums=('ed112523ae424aea46904d2dcfc769b0263cf552f5bfec0e30601f6f0f95eada'
            '5ba7e6d5e502882c3534d1d8578f7fd29fdf3d2aeb49206efa7b3514a7e3e821'
            'dd9d17fbb29371ebb51d64ac2f5ec58fde2fce919fb49d95038cde064567c5d7')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  
  # patches here
  patch -Np0 < "${srcdir}/kernel-4.11.patch"
  patch -Np1 < "${srcdir}/kernel-4.14.patch"
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

  cd uvm
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
  install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 \
    "${srcdir}/${_pkg}/kernel"/{nvidia,uvm/nvidia-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"
}

# vim:set ts=2 sw=2 et:
