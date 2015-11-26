# $Id: PKGBUILD 247915 2015-09-30 05:17:55Z fyan $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-zen
pkgname=(nvidia-zen nvidia-zen-dkms)
pkgver=358.16
_extramodules=extramodules-4.2-zen
pkgrel=2.1
pkgdesc="NVIDIA drivers for linux-zen"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-zen' 'linux-zen-headers>=4.2' 'linux-zen-headers<4.3')
license=('custom')
options=('!strip')
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha512sums_i686=('a5d37fb56a59b9958f6c34139250baf13a1c42ffc70f7deb19ffaac1ae6c2ce80b96649c5797d60754050d75792d14141cd5ebc8820bb73ee4aad4aa6d6c5b20')
sha512sums_x86_64=('eb1abeebbfa807c784e9019afaa3f238d2142b28467c80dcac8d5199cf1082d72ab417e39660bda076023aecb7d04d9c3c91a2d494f1513cfe82b617b17a2297')

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
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"' dkms.conf
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-zen() {
    pkgdesc="NVIDIA drivers for linux-zen"
    depends=('linux-zen>=4.2' 'linux-zen<4.3' "nvidia-utils=${pkgver}" 'libgl')
    install=nvidia.install

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
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
    echo 'blacklist nouveau' > "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}
