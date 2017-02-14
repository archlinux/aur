# Maintainer : Christian Hofmann <chof@pfho.net>
# Contributor : Sameed Pervaiz <greenbagels@teknik.io>
# Contributor: Kaan Genç <aur@kaangenc.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-grsec
pkgname=(nvidia-grsec nvidia-grsec-dkms)
pkgver=375.26
_pkgver=375.20
_extramodules=extramodules-4.9.9-grsec
pkgrel=4
pkgdesc="NVIDIA drivers for linux-grsec kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-grsec' 'linux-grsec-headers>=4.9')
license=('custom')
options=(!strip)
# source=("https://www.grsecurity.net/~paxguy1/nvidia-drivers-${pkgver}-pax.patch")
source=("https://www.grsecurity.net/~paxguy1/nvidia-drivers-${_pkgver}-pax.patch")
source_i686=("http://http.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://http.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha512sums=('65ad102cc3c28c6e2d67c4f24c8fe6ca3b9b4b4f57eca6fdf437127ce9caccabebd3049af53b30ba808e68529b5627a7e3add31b42cffb09d648a69bedfa55d9')
sha512sums_i686=('3bc859a95469a45f3c627018248d83e178d160385c3d17d9f890b0d142ecd1220fb21c442e4fe7755b831227a9c820736f447b162acd9699819c6e8145d6d841')
sha512sums_x86_64=('f52f6597daa1eaf4cbd934d785da6028ef23ecef98e14746143e3738504f8d65b73788abbcf9fd812317fc2c53cdf1c4d4839de57fafdea1930a08c6b21f1992')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
    # Using the updated grsecurity-provided patch
    patch -Np1 -i "../nvidia-drivers-${_pkgver}-pax.patch"

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
echo -e "# Only build for scoped kernels." >> dkms.conf
echo -e "BUILD_EXCLUSIVE_KERNEL=\0042^4.9.*grsec$\0042" >> dkms.conf
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-grsec() {
    pkgdesc="NVIDIA drivers for linux-grsec kernel"
    depends=('linux-grsec>=4.9' "nvidia-utils=${pkgver}" 'libgl')
    install=nvidia-grsec.install

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

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-grsec.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${pkgname}.install"
}

package_nvidia-grsec-dkms() {
    pkgdesc="NVIDIA driver sources for linux-grsec kernel"
    depends=('dkms' "nvidia-utils=${pkgver}" 'libgl')
    optdepends=('linux-grsec-headers: build modules against the grsec kernel')
    conflicts+=('nvidia-grsec')

    cd ${_pkg}
    install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,src}
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-grsec-${pkgver}"
    echo 'blacklist nouveau' >> "${pkgdir}/usr/lib/modprobe.d/nvidia-grsec.conf"
}
