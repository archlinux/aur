# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=nvidia-340xx
pkgname=(nvidia-340xx nvidia-340xx-dkms)
pkgver=340.107
pkgrel=94
pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux>=5.4' 'linux-headers>=5.4')
conflicts=('nvidia')
license=('custom')
options=(!strip)
# seems manjaro is keeping this current
# https://gitlab.manjaro.org/packages?utf8=%E2%9C%93&filter=nvidia-340xx
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  'kernel-4.11.patch' 'kernel-5.0.patch' 'kernel-5.2.patch' 'kernel-5.3.patch' 'kernel-5.4.patch'
)
sha256sums=('6dc6f183c69c414670d8adef0286a2362eedd6e16ec6dfae811e48ea4a4505dc'
            '8bbb99a5be38520793b9898f7a82116595260bfe667708957fb0bdabaa570dfb'
            'b1e539b507dfbffda831de2c7145b62f9fc28e9df2c39cb7c22754e74057886e'
            'f5f28225a621484286b2830c777db82065ff299536e6c2c851e68c326d2d0b73'
            '5ebfdad300029d41c5bc2b8cca4d661abf8f0aa1de8c0f9e7e03de1580e6395e'
            '6bb80349d980b48a7fc62cec4d6f36b408b51263d461b4b9935fac729dd701b6')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

# default is 'linux' substitute custom name here
_kernelname=linux
_kernver="$(</usr/src/$_kernelname/version)"
_extradir="/usr/lib/modules/$_kernver/extramodules"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"

  # patches here
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    (cd kernel ; patch -p1 --no-backup-if-mismatch -i "../../$src")
  done

  cp -a kernel kernel-dkms
}

build() {
  cd "${_pkg}/kernel"
  make SYSSRC="/usr/src/$_kernelname" module

  cd uvm
  make SYSSRC="/usr/src/$_kernelname" module
}

package_nvidia-340xx() {
  pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
  depends=('linux>=5.3.6' "nvidia-340xx-utils=$pkgver" 'libgl')

  install -Dt "${pkgdir}${_extradir}" -m644 \
    "${srcdir}/${_pkg}/kernel"/{nvidia,uvm/nvidia-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx.conf"
}

package_nvidia-340xx-dkms() {
    pkgdesc="NVIDIA driver sources for linux, 340xx legacy branch"
    depends=('dkms' "nvidia-340xx-utils=$pkgver" 'libgl')
    optdepends=('linux-headers: Build the module for Arch kernel')
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
