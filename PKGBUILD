# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-340xx-ck
pkgver=340.104
_extramodules=extramodules-4.14-ck
pkgrel=6
pkgdesc="NVIDIA drivers for linux-ck, 340xx legacy branch."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.14' 'linux-ck<4.15' 'libgl' "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.14' 'linux-ck-headers<4.15' 'nvidia-340xx-libgl')
conflicts=('nvidia-ck' 'nvidia-304xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=readme.install
options=(!strip)
source=('kernel-4.11.patch')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('ed112523ae424aea46904d2dcfc769b0263cf552f5bfec0e30601f6f0f95eada')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  
  # patches here
  patch -Np0 < "${srcdir}/kernel-4.11.patch"
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

  cd uvm
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
  install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
  gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
  install -dm755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-ck.conf"
}

# vim:set ts=2 sw=2 et:
