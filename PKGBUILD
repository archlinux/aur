# Maintainer : Sameed Pervaiz <greenbagels@teknik.io>
# Contributor: Kaan Genç <aur@kaangenc.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-grsec
pkgname=(nvidia-grsec nvidia-grsec-dkms)
pkgver=364.16
_extramodules=extramodules-4.4.7-grsec
pkgrel=2
pkgdesc="NVIDIA drivers for linux-grsec kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-grsec' 'linux-grsec-headers>=4.4' 'linux-grsec-headers<4.5')
license=('custom')
options=(!strip)
#source=("https://www.grsecurity.net/~paxguy1/nvidia-drivers-${pkgver}-pax.patch")
#364.16 patch not on the website, and no errors reported (as of this change) with this patch
source=("https://www.grsecurity.net/~paxguy1/nvidia-drivers-364.12-pax.patch")
# Temporarily changed as the scripts aren't in the main FTP yet, see package nvidia-utils for more details
#source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
#source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
source_i686=("NVIDIA-Linux-x86-${pkgver}.run::https://developer.nvidia.com/linux32bit")
source_x86_64=("NVIDIA-Linux-x86_64-${pkgver}.run::https://developer.nvidia.com/linux64bit")
sha512sums=('a83c264564850d5e31d5673ec332f5a55f95ebdd07415a72bd702e635bca1d4b5a5d30531be89376e2846fee46e273620e0001dd4381cc3b41127e4764901f27')
sha512sums_i686=('6878c7552eda31c0ea8092dfd5050611f15c1d94a778e945fdc1190860ad13878308323bf6b0f420002b5322adb7d5b545bf69c5336c9cacf16030b799e0ca67')
sha512sums_x86_64=('a937f736f90e3bf9f9b1539be58445d2b7957a7bad2ab6babf9c04bf550e81990d1358e0b0bda3de537500584073500d260da9dfb909701bdffb268ca3db62da')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
    # change this when the patch comes back to the same version as the driver
    # patch -Np1 -i "../nvidia-drivers-${pkgver}-pax.patch"
    patch -Np1 -i "../nvidia-drivers-364.12-pax.patch"

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
echo -e "BUILD_EXCLUSIVE_KERNEL=\0042^4.4.*grsec$\0042" >> dkms.conf
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-grsec() {
    pkgdesc="NVIDIA drivers for linux-grsec kernel"
    depends=('linux>=4.4' 'linux<4.5' "nvidia-utils=${pkgver}" 'libgl')
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
    echo 'blacklist nouveau' > "${pkgdir}/usr/lib/modprobe.d/nvidia-grsec.conf"
}
