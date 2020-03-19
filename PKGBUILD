# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=nvidia-340xx
pkgname=(nvidia-340xx nvidia-340xx-dkms)
pkgver=340.108
pkgrel=6
pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux>=5.5' 'linux-headers>=5.5')
conflicts=('nvidia')
license=('custom')
options=(!strip)
# seems manjaro is keeping this current
# https://gitlab.manjaro.org/packages?utf8=%E2%9C%93&filter=nvidia-340xx
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  01-fix_multi_core_build.patch
  02-unfuck-for-340.108-build-fix.patch
  03-unfuck-for-5.5.x.patch
  04-fix_message_in_dmesg.patch
)
sha256sums=('995d44fef587ff5284497a47a95d71adbee0c13020d615e940ac928f180f5b77'
            '82d14e9e6ec47c345d225d9f398238b7254cd5ae581c70e8521b9157ec747890'
            '2b7e3ef24846a40f4492e749be946e4f7f70ebed054bc2c9079f6cbdcbfabe57'
            'c28d65854dd03e6a9e00d79fa0ca3521c11b2c198882bbd50870c8e71d18d765'
            '7f90e80be6338f6fc902d257d8ceb09e89b40d008f7a3ad9fe82833cd5b89316')
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
