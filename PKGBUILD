# $Id: PKGBUILD 223837 2014-10-04 03:09:12Z svenstaro $
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=nvidia-340xx-lts-ck
pkgver=340.76
_extramodules=extramodules-3.14-lts-ck
pkgrel=15
pkgdesc="NVIDIA drivers for linux-lts-ck"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lts-ck>=3.14.25' "nvidia-340xx-utils=$pkgver" 'nvidia-340xx-libgl')
makedepends=('linux-lts-ck-headers>=3.14.25')
provides=('nvidia-340xx')
conflicts=('nvidia-lts-ck')
license=('custom')
install=${pkgname}.install
options=(!strip)
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums_i686=('8064c0a0998c3e7ee3c98ac1832b8194')
md5sums_x86_64=('440df290e213280d6e20d4d4be6f8b4c')
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
