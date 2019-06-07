# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=nvidia-340xx-lts
pkgver=340.107
_extramodules=extramodules-4.19-lts
pkgrel=24
pkgdesc="NVIDIA drivers for linux-lts"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=('linux-lts>=4.19.46' 'linux-lts-headers>=4.19.46' "nvidia-340xx-utils=$pkgver")
provides=('nvidia-340xx')
conflicts=('nvidia-lts')
license=('custom')
options=(!strip)
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
        'kernel-4.11.patch')
sha512sums=('0de6f182d67bd322df7ae04e74c0cde6973c55bfea47a8f2503a29f8a899cd1b801ae4b52d066628df4a4f9c84e5e7547465bdc37d1b87df47af43fdab23466f'
            'c25d90499e1deb26129a67dd7e953be8c1e31c5770e2b8b64d03af54cf1afec1a52636e74900f8ac468692207ab8a3765a12edd581142c4d2cfd2d6e66ac7ac2')

[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh ${_pkg}.run --extract-only
    cd "${_pkg}"
    # patches here
    patch -Np0 < "${srcdir}/kernel-4.11.patch"
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/${_kernver}/build module

  cd uvm
  make SYSSRC=/usr/lib/modules/${_kernver}/build module
}

package() {
  depends=('linux-lts>=4.19.46' "nvidia-340xx-utils=$pkgver" 'libgl')

  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia-uvm.ko"
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/"*.ko
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts.conf"
  echo "blacklist nvidiafb" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts.conf"
  install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-lts/LICENSE"
}
