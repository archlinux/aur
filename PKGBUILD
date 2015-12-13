# $Id: PKGBUILD 150197 2012-02-14 11:22:48Z ibiru $
# Maintainer : Claire Farron

pkgname=nvidia-lts310-ck
pkgver=358.16
_extramodules=extramodules-3.10-lts310-ck
pkgrel=1
pkgdesc="NVIDIA drivers for linux-lts310-ck"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=("nvidia-utils=$pkgver" "nvidia-libgl=$pkgver" 'linux-lts310-ck' 'linux-lts310-ck-headers')
provides=('nvidia')
license=('custom')
install=nvidia-lts310-ck.install
options=(!strip)

source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums_i686=('d3a2842cbfb1163e20c658fbfaf5a235d5c9f035cd2d657f15df8a14b3fe80b1')
sha256sums_x86_64=('4f0f02d1eb123128d133a5fd00a5ff129b2ac0482f552e15eafa8baa943321f7')
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
    msg2 "Building Unified memory module..."
    make SYSSRC=/usr/lib/modules/${_kernver}/build module
  fi
}

package() {
  depends=('linux-lts310-ck' "nvidia-utils=$pkgver" 'libgl')
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia-modeset.ko"
  if [[ $CARCH = x86_64 ]]; then
    install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
      "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia-uvm.ko"
  fi
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/"*.ko
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts310-ck.conf"
  echo "blacklist nvidiafb" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts310-ck.conf"
  install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-lts310-ck/LICENSE"
}
