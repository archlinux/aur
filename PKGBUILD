# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=nvidia-340xx
pkgname=(nvidia-340xx nvidia-340xx-dkms)
pkgver=340.108
pkgrel=15
pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux>=5.5' 'linux-headers>=5.5')
conflicts=('nvidia')
license=('custom')
options=(!strip)
_us='https://raw.githubusercontent.com/warpme/minimyth2/master/script/nvidia/nvidia-340.108/files'
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  1001.patch::$_us/nvidia-340.108-fix-5.6-kernel-compile.patch
  1002.patch::$_us/nvidia-340.108-5.7-kernel-reinstate-legacy-support.patch
  1003.patch::$_us/nvidia-340.108-fix-5.7-kernel-compile.patch
  1004.patch::$_us/nvidia-340.108-fix-5.8-kernel-compile.patch
  1005.patch::$_us/nvidia-340.108-fix-5.9-kernel-compile.patch
  1006.patch::$_us/nvidia-340.108-fix-5.10-kernel-compile.patch
  1007.patch::${_us/warpme/graysky2/}/nvidia-340.108-fix-5.11-kernel-compile.patch
)
b2sums=('6538bbec53b10f8d20977f9b462052625742e9709ef06e24cf2e55de5d0c55f1620a4bb21396cfd89ebc54c32f921ea17e3e47eaa95abcbc24ecbd144fb89028'
        'ffb860a2d4477e7b050b983833e01d08dbaa944f81165bf8bfa5f0746abbdc80328bc5846227d572050a9db90de423538bc47446c616aa32b2fb919d28aa9a37'
        '804d20661330485f2d5aa75839ff2e8b6a47dff32d49d84a29bb52578441952fbe76e2db36c6e8c6a12f93f2945a28ef5c44398b912a2fe03aa6efaee9120b18'
        '8da3df49fa57e781be3f8a4c8b6d8c13e52a9eb9970c85658f503d9fbf47383eebb439a8d20d1cc79eff822b856a15ce4f7a5f0c97ddeb14bb2c26e74454f7b5'
        '784ffa566db853797e9b1d5bc92ec24e8d44b0027b02def4f88b9a3c5a65a7ae392888c93a36f81d9b9b03137ae445c2337008867fd595f8a8c6b4471111723e'
        'cb2521375317a368d7a5b4766071d0dfb09f359f7521f769e581b083540bfcbaab18f2d1b308d4e668841ef15dbeebcf0495b3cbaa2c9ee1a8b6a35308206e6e'
        '74eb8f62aa973e58d818ad1c0102a3f914288c210ab117bea568481dbcf944b509b3dce3425f95f7a83b1838d0409497a270aec4509a3112617fe998b19ba410'
        '6852fcfbf1362f0f2ce13f6e07065212b6d8bc27c79781eeea8fe3e678d7127355425a066595ac1550a85ee52dc2963f944c73a636153c6be0ff89e13c348838')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

# default is 'linux' substitute custom name here
_kernelname=linux
_kernver="$(</usr/src/$_kernelname/version)"
_extradir="/usr/lib/modules/$_kernver/extramodules"

prepare() {
  sh "${_pkg}.run" --extract-only

  cd "${_pkg}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 1*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
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
