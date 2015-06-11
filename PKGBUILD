# $Id: PKGBUILD 150197 2012-02-14 11:22:48Z ibiru $
# Maintainer : Claire Farron
# Contributor: Mamut Ghiunhan <venerix [at] gmail [dot] com> (Previous Maintainer)

pkgname=nvidia-lts-ck
pkgver=352.09
_extramodules=extramodules-3.14-lts-ck
pkgrel=2
pkgdesc="NVIDIA drivers for linux-lts-ck"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lts-ck>=3.14.25' "nvidia-utils=$pkgver" 'nvidia-libgl')
makedepends=('linux-lts-ck-headers>=3.14.25')
provides=('nvidia')
groups=('lts-ck-generic')
license=('custom')
install=nvidia-lts-ck.install
options=(!strip)

source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums_i686=('0e009686400c522209eaa8ab835ff81f')
md5sums_x86_64=('eb5ad6a07dc03e0a19d5f6fa069c494b')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/${_kernver}/build module

  # Unified memory: http://devblogs.nvidia.com/parallelforall/unified-memory-in-cuda-6/
  if [[ $CARCH = x86_64 ]]; then
    cd uvm
    msg2 "Building Unified memory module for $_kernel..."
    make SYSSRC=/usr/lib/modules/${_kernver}/build module
  fi
}

package() {
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia.ko"
  if [[ $CARCH = x86_64 ]]; then
    install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
      "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia-uvm.ko"
  fi
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/"*.ko
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts-ck.conf"
  echo "blacklist nvidiafb" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts-ck.conf"
  install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-lts-ck/LICENSE"
}
