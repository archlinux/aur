# $Id: PKGBUILD 264861 2016-04-14 05:06:52Z tpowa $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-pae
pkgname=(nvidia-pae nvidia-pae-dkms)
pkgver=364.19
_extramodules=extramodules-4.5-pae
pkgrel=1
pkgdesc="NVIDIA drivers for linux"
arch=('i686')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-pae' 'linux-pae-headers>=4.5' 'linux-pae-headers<4.6')
license=('custom')
options=('!strip')
# See nvidia-utils
source=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
md5sums=('8a4015213c4a8f1c80e9520d04a32a7b')

_pkg="NVIDIA-Linux-x86-${pkgver}"

prepare() { 
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here

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
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-pae() {
    pkgdesc="NVIDIA drivers for linux"
    depends=('linux-pae>=4.5' 'linux-pae<4.6' "nvidia-utils=${pkgver}" 'libgl')
    install=nvidia.install

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-drm.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}

package_nvidia-pae-dkms() {
    pkgdesc="NVIDIA driver sources for linux"
    depends=('dkms' "nvidia-utils=$pkgver" 'libgl')
    optdepends=('linux-pae-headers: Build the module for Arch PAE kernel'
                'linux-lts-headers: Build the module for LTS Arch kernel')
    conflicts+=('nvidia')

    cd ${_pkg}
    install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,src}
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
    echo 'blacklist nouveau' > "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}
