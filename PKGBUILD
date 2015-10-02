# $Id: PKGBUILD 223837 2014-10-04 03:09:12Z svenstaro $
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=nvidia-340xx-lts-ck
pkgver=340.93
_extramodules=extramodules-3.14-lts-ck
pkgrel=1
pkgdesc="NVIDIA drivers for linux-lts-ck"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lts-ck>=4.1' 'linux-lts-ck<4.2' "nvidia-340xx-utils=$pkgver" 'nvidia-340xx-libgl')
makedepends=('linux-lts-ck-headers>=4.1' 'linux-lts-ck-headers<4.2')
provides=('nvidia-340xx')
conflicts=('nvidia-lts-ck')
license=('custom')
install=${pkgname}.install
options=(!strip)

source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums_i686=('94ce6b879581b931b84d83a9111040b9a5aa9306b012b4380cd93f6ffede3066')
sha256sums_x86_64=('0fcc6a62a05fc11344aff375faaca56b358ee1252f6b2c98c00d628ea3d0f842')
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
