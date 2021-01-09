# Maintainer: Jonathon Fernyhough <jonathon at+m2x+dev>
# Contributor: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: loqs
# Contributor: Dede Dindin Qudsy <xtrymind+gmail+com>
# Contributor: Ike Devolder <ike.devolder+gmail+com>

pkgbase=nvidia-390xx
pkgname=(nvidia-390xx nvidia-390xx-dkms)
pkgver=390.141
pkgrel=1
pkgdesc="NVIDIA drivers for linux, 390xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-headers')
conflicts=('nvidia')
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        'kernel-4.16.patch')
b2sums=('fae33e5fcd8f0429f163ad40e58a07c42ff47260bd1b0f56989d6147d63294c475f33ddc02f06a16eaf8c8ea9f74a98dbcb32b5322c68661331ebf7dfe976770'
        '1d21307640a3844752c92e8344518daf6ad62d846689bebe6eed4dcadbf7b2e742862f5c17c0faee7256662cb75e62e124d59e5a5617e87324e1f0658f2b748d'
        '3ea3b298db0af192eb79a67d2307c92229defefc4cf66d09e24b85015de03b64a57b420233ca5532c6f57f35e007bc982c27333f2fc43a016a84cc797f67b191'
        '7358919041a3d5df1cac50f6519b282abe7a344f07b59d52ab95a022ce0af12e743a1c194fd838b5733f3900e68c7f0756a528ac32255775f2ba830a2f052dec'
        '8d7c054ff08ed6212aa81f3db6597c1e016609bdddfb19161274e5e75b0ae8b5c5501740ca6a75367d152b16f8350319bd2577561aa796cfe49840c4bd2c2d5d'
        '4f61721cb9f3f76953c552ac8c131a592418078be63f98d43bd7248422cb2d88cfc1341f64b9124c7f102bf17635bb2734bd597b7b1011cc24223a5cc5fbf233')

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 390.138)
    # From loqs via https://bugs.archlinux.org/task/58074
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
