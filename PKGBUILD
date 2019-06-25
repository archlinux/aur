# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-340xx-ck
pkgver=340.107
_extramodules=extramodules-ck
pkgrel=78
pkgdesc="NVIDIA drivers for linux-ck, 340xx legacy branch."
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck' 'libgl' "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-ck-headers' 'nvidia-340xx-libgl')
conflicts=('nvidia-ck' 'nvidia-390xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
'kernel-4.11.patch' 'kernel-5.0.patch' 'kernel-5.1.patch'
)
sha256sums=('6dc6f183c69c414670d8adef0286a2362eedd6e16ec6dfae811e48ea4a4505dc'
            '5ba7e6d5e502882c3534d1d8578f7fd29fdf3d2aeb49206efa7b3514a7e3e821'
            '236a1d1dc9adc1cafec828f0650d5a15f1f6d0fa27905dab58ca072a46f159fa'
            '2b0e69814bfaee6b227bbf15d89d056ab27d84bd325248614e27cb5fa33a63a1')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"

  # patches here
  patch -Np0 < "${srcdir}/kernel-4.11.patch"
  patch -Np0 < "${srcdir}/kernel-5.0.patch"
  patch -Np0 < "${srcdir}/kernel-5.1.patch"
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
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-ck.conf"
}

# vim:set ts=2 sw=2 et:
