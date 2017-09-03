#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-zen
pkgname=(nvidia-zen nvidia-zen-dkms)
pkgver=384.69
_extramodules=extramodules-4.12-zen
pkgrel=1
pkgdesc="NVIDIA drivers for linux-zen"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-zen' 'linux-zen-headers>=4.12' 'linux-zen-headers<4.13')
license=('custom')
options=('!strip')
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha512sums_i686=('7bd55906111ed00bc8aef75a70ee636dc5a8fc22196a94d29cd651b5083b1974e45194ee7091dbb7db4f70706297bdf1c9e5f658500fc28323030684a3670663')
sha512sums_x86_64=('8e48416fb4d0cb781ae3611fcd710c73ef9276eebc79950bf8ae5ea484fb2f06356b1f9628b35062a2e98bfb4b1fa70322e1ac243b97b28766f73ef6e630cabf')

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
    depends=('linux-zen>=4.11' 'linux-zen<4.12' "nvidia-utils=${pkgver}" 'libgl')
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
