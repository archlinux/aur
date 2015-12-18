# $Id: PKGBUILD 223837 2014-10-04 03:09:12Z svenstaro $
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=nvidia-340xx-lts-ck
pkgver=340.96
_extramodules=extramodules-4.1-lts-ck
pkgrel=2
pkgdesc="NVIDIA drivers for linux-lts-ck"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('linux-lts>=4.1.11' 'linux-lts-headers>=4.1.11' "nvidia-340xx-utils=$pkgver" "nvidia-340xx-libgl=${pkgver}")
provides=('nvidia-340xx')
conflicts=('nvidia-lts-ck')
license=('custom')
install=${pkgname}.install
options=(!strip)
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums_i686=('c40e2778cd1ab036a76e1896fe2f77c4aa7baa215dbbdb11a2f4c5f05e1a478e')
sha256sums_x86_64=('280f9db2aea52cab42e141f0393604c7a6d43e7f65d3e60c2319c2674ecc14c4')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh ${_pkg}.run --extract-only
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/${_kernver}/build module

  cd uvm
  make SYSSRC=/usr/lib/modules/${_kernver}/build module
}

package() {
  depends=('linux-lts>=4.1.11' "nvidia-340xx-utils=$pkgver" 'libgl')
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia-uvm.ko"
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/"*.ko
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-lts-ck.conf"
  echo "blacklist nvidiafb" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-lts-ck.conf"
  install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-340xx-lts-ck/LICENSE"
}
