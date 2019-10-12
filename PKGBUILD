# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-ck
pkgname=(nvidia-ck nvidia-ck-dkms)
pkgver=435.21
pkgrel=11
epoch=2
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-utils=${pkgver}" 'libglvnd' 'linux-ck' 'linux-ck-headers')
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        fs62142.patch)
sha256sums=('fac7c02ccd35c7043f4e1add0224a7380d0bd1e4aa15ca6bc3012c758ec1776c'
            '24a3082688ee4d60d27f601d535b1e6ced7537b46cc83fc9bb6da0f76e07e017')

# default is 'linux' substitute custom name here
_kernelname=linux-ck
_kernver="$(</usr/src/$_kernelname/version)"
_extradir="/usr/lib/modules/$_kernver/extramodules"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"

   # Fix https://bugs.archlinux.org/task/62142
   patch -Np1 -i ../fs62142.patch

   cp -a kernel kernel-dkms
   cd kernel-dkms
   sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
   sed -i 's/__JOBS/`nproc`/' dkms.conf
   sed -i 's/__DKMS_MODULES//' dkms.conf
   sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"' dkms.conf

  # Gift for linux-rt guys
  sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

build() {
	cd "${_pkg}"/kernel
  make SYSSRC=/usr/src/"$_kernelname" module
}

package_nvidia-ck() {
  pkgdesc="NVIDIA drivers for linux-ck."
  depends=('dkms' "nvidia-utils=${pkgver}" 'libglvnd')

  install -Dt "${pkgdir}${_extradir}" -m644 \
    "${srcdir}/${_pkg}/kernel"/nvidia{,-modeset,-drm,-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-ck-dkms() {
  pkgdesc="NVIDIA drivers for linux-ck."
  depends=('dkms' "nvidia-utils=${pkgver}" 'libglvnd')
  optdepends=('linux-ck: Build the module for ck kernel')
  provides=("nvidia=$pkgver")
  conflicts+=('nvidia-ck')

  cd "${_pkg}"
  install -dm 755 "${pkgdir}"/usr/src

  cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

# vim:set ts=2 sw=2 et:
