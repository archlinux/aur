# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-340xx-ck
pkgver=340.102
_extramodules=extramodules-4.9-ck
pkgrel=2
pkgdesc="NVIDIA drivers for linux-ck, 340xx legacy branch."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.9' 'linux-ck<4.10' 'libgl' "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.9' 'linux-ck-headers<4.10' 'nvidia-340xx-libgl')
conflicts=('nvidia-ck' 'nvidia-304xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=readme.install
options=(!strip)
source=('unfuck_kernel_4.9_series.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('d1741377218e512063434c52a62a4fe3cfb23ab0a0ebc9fc817567692541e73e')
sha256sums_i686=('61b13d5dae0f6f5d788a4d8c4c98e8d971d19cb90b606058060d007946248828')
sha256sums_x86_64=('6a36bd9a0033769ecd11ce2aa60aeb41b50b20616c43fd19c55e027c451f585e')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  patch -Np0 -i "$srcdir/unfuck_kernel_4.9_series.patch"
  cp -a kernel kernel-dkms
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
