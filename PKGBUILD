# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-390xx-ck
pkgname=(nvidia-390xx-ck nvidia-390xx-ck-dkms)
pkgver=390.129
pkgrel=11
pkgdesc="NVIDIA drivers for linux-ck, 390xx legacy branch."
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-ck' 'linux-ck-headers')
conflicts=('nvidia')
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  'kernel-4.16.patch')
sha256sums=('a7925a327cab828d1eb9e74f8943623c5dbc9a5e376a4c0184065d4a319696c1'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')

# default is 'linux' substitute custom name here
_kernelname=linux-ck
_kernver="$(</usr/src/$_kernelname/version)"
_extradir="/usr/lib/modules/$_kernver/extramodules"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 396.18)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch

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
  make SYSSRC="/usr/src/$_kernelname" module
}

package_nvidia-390xx-ck() {
  pkgdesc="NVIDIA drivers for linux-ck, 390xx legacy branch."
  depends=('linux-ck' "nvidia-390xx-utils=${pkgver}" 'libglvnd')

  install -Dt "${pkgdir}${_extradir}" -m644 \
    "${srcdir}/${_pkg}/kernel"/nvidia{,-modeset,-drm,-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-390xx-ck.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-390xx-ck-dkms() {
    pkgdesc="NVIDIA driver sources for linux-ck, 390xx legacy branch"
    depends=('dkms' "nvidia-390xx-utils=$pkgver" 'libglvnd')
    optdepends=('linux-ck-headers: Build the module for ck kernel')
    provides=("nvidia-390xx=$pkgver")
    conflicts+=('nvidia-390xx')

    cd "${_pkg}"

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

# vim:set ts=2 sw=2 et:
