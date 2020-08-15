# Maintainer: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-390xx
pkgname=(nvidia-390xx nvidia-390xx-dkms)
pkgver=390.138
pkgrel=5
pkgdesc="NVIDIA drivers for linux, 390xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-headers')
conflicts=('nvidia')
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        'kernel-4.16.patch'
        'kernel-5.8.patch')
sha256sums=('a34a19b618be0eb06c4699247489833a8f22c59423f246248614e0a59b1508da'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385'
            'e3df2945e29a9834d2c1c21eb6871b1672f25bd809b413cd5e0b45d0d2c815a5')

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 396.18) (and still needed for 390.138)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch

    # 5.8 Patch
    patch -Np1 -i ../kernel-5.8.patch


    ## OLD PATCHES [390.132] ##

    # Patch to avoid screen tearing on Optimus Systems [Geeko]
    # patch -Np1 -i ../kernel-5.5.patch

    # Patch to make it compile under linux 5.6
    # patch -Np1 -i ../kernel-5.6.patch

    # Patch to make it compile under linux 5.7 - Courtesy of openglfreak
    # patch -Np1 -i ../kernel-5.7.patch
    
    ###########################

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
    make SYSSRC=/usr/src/linux module
}

package_nvidia-390xx() {
    pkgdesc="NVIDIA drivers for linux, 390xx legacy branch"
    depends=('linux' "nvidia-390xx-utils=${pkgver}" 'libglvnd')

    _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    install -Dt "${pkgdir}${_extradir}" -m644 \
      "${srcdir}/${_pkg}/kernel"/nvidia{,-modeset,-drm,-uvm}.ko

    find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-390xx-dkms() {
    pkgdesc="NVIDIA driver sources for linux, 390xx legacy branch"
    depends=('dkms' "nvidia-390xx-utils=$pkgver" 'libglvnd')
    provides=("nvidia-390xx=$pkgver")
    conflicts+=('nvidia-390xx')

    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}
