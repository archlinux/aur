# Maintainer : Sameed Pervaiz <greenbagels@teknik.io>
# Contributor: Kaan Genç <aur@kaangenc.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-grsec
pkgname=(nvidia-grsec nvidia-grsec-dkms)
pkgver=367.27
_extramodules=extramodules-4.5.7-grsec
pkgrel=2
pkgdesc="NVIDIA drivers for linux-grsec kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-grsec' 'linux-grsec-headers>=4.5' 'linux-grsec-headers<4.6')
license=('custom')
options=(!strip)
source=("https://www.grsecurity.net/~paxguy1/nvidia-drivers-364.27-pax.patch")
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha512sums=('b5565defe3ee85dd1329f37b0630363b787497bcbfed40d5909e9dba0281bf1ceb23929fb76331277653effca1bc64a944427cc6901a05a0c2f04af5aa3ad3b1')
sha512sums_i686=('54302f0de936a859561b756989ff84f73afe41dfb89ed680ee3df3c46b0de9d57eaf2d07876dea0eb1154fbc1a716d4d3e693cb7eaa7ab325b4bbee569ddb709')
sha512sums_x86_64=('bb1cdfb28cf2c2216b39380994aedd4c5568d83e759aeb588be0f4784475a34c23410c2d6076b05a8163cc6cd1428c6a79e172bb3327e0160c4adf34454d3968')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
    # Using the updated grsecurity-provided patch
    patch -Np1 -i "../nvidia-drivers-364.27-pax.patch"

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
echo -e "BUILD_EXCLUSIVE_KERNEL=\0042^4.5.*grsec$\0042" >> dkms.conf
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-grsec() {
    pkgdesc="NVIDIA drivers for linux-grsec kernel"
    depends=('linux-grsec>=4.5' 'linux-grsec<4.6' "nvidia-utils=${pkgver}" 'libgl')
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
