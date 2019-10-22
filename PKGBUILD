# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=nvidia-340xx-lts
pkgname=(nvidia-340xx-lts nvidia-340xx-lts-dkms)
pkgver=340.107
pkgrel=26
pkgdesc="NVIDIA drivers for linux-lts, 340xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux-lts>=4.19.79' 'linux-lts-headers>=4.19.79')
conflicts=('nvidia-lts')
license=('custom')
options=(!strip)
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  'kernel-4.11.patch' 'kernel-5.0.patch' 'kernel-5.1.patch'
)
sha256sums=('6dc6f183c69c414670d8adef0286a2362eedd6e16ec6dfae811e48ea4a4505dc'
            '5ba7e6d5e502882c3534d1d8578f7fd29fdf3d2aeb49206efa7b3514a7e3e821'
            '236a1d1dc9adc1cafec828f0650d5a15f1f6d0fa27905dab58ca072a46f159fa'
            '2b0e69814bfaee6b227bbf15d89d056ab27d84bd325248614e27cb5fa33a63a1')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

# default is 'linux' substitute custom name here
_kernelname=linux-lts
_kernver="$(</usr/src/$_kernelname/version)"
_extradir="/usr/lib/modules/$_kernver/extramodules"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"

  # patches here
  patch -Np0 < "${srcdir}/kernel-4.11.patch"
  patch -Np0 < "${srcdir}/kernel-5.0.patch"
  patch -Np0 < "${srcdir}/kernel-5.1.patch"

  cp -a kernel kernel-dkms
}

build() {
  cd "${_pkg}/kernel"
  make SYSSRC="/usr/src/$_kernelname" module

  cd uvm
  make SYSSRC="/usr/src/$_kernelname" module
}

package_nvidia-340xx-lts() {
  pkgdesc="NVIDIA drivers for linux-lts, 340xx legacy branch."
  depends=('linux-lts>=4.19.72' "nvidia-340xx-utils=$pkgver" 'libgl')

  install -Dt "${pkgdir}${_extradir}" -m644 \
    "${srcdir}/${_pkg}/kernel"/{nvidia,uvm/nvidia-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-lts.conf"
}

package_nvidia-340xx-lts-dkms() {
    pkgdesc="NVIDIA driver sources for linux-lts, 340xx legacy branch"
    depends=('dkms' "nvidia-340xx-utils=$pkgver" 'libgl')
    optdepends=('linux-lts-headers: Build the module for lts kernel')
    provides=("nvidia-340xx=$pkgver")
    conflicts+=('nvidia-340xx')

    cd "${_pkg}"

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
    cat "${pkgdir}"/usr/src/nvidia-${pkgver}/uvm/dkms.conf.fragment >> "${pkgdir}"/usr/src/nvidia-${pkgver}/dkms.conf

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
