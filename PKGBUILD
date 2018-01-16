#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-zen
pkgname=(nvidia-zen nvidia-zen-dkms)
pkgver=387.34
_extramodules=extramodules-4.14-zen
pkgrel=0
pkgdesc="NVIDIA drivers for linux-zen"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-zen' 'linux-zen-headers>=4.14' 'linux-zen-headers<4.15')
license=('custom')
options=('!strip')
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha512sums_i686=('ba9362123a75f85a0a5a9dcc95c06bcb350a8dff2db864db30a73172db44006fa39eee8e23cf959ab2012b61b922d1f0d7ab225329815737819f27d1be300b95')
sha512sums_x86_64=('0a472f8e446dee01f9e526d4de4f6d587a97ad36dd36da66ab15243b6194a8198cbaf9ad3394558fdc963dd56ef1daaf519ed9cd69d59bc990bd56626897f5c8')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

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

package_nvidia-zen() {
    pkgdesc="NVIDIA drivers for linux-zen"
    depends=('linux-zen>=4.14' 'linux-zen<4.15' "nvidia-utils=${pkgver}" 'libgl')
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

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-zen.conf"
}

package_nvidia-zen-dkms() {
    pkgdesc="NVIDIA driver sources for linux-zen"
    depends=('dkms' "nvidia-utils=$pkgver")
    optdepends=('linux-zen-headers: Build the module for Arch Zen kernel'
                'linux-headers: Build the module for Arch kernel'
                'linux-lts-headers: Build the module for LTS Arch kernel')
    conflicts+=('nvidia nvidia-zen')
    install=nvidia-dkms.install

    cd ${_pkg}
    install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,src}
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
}
