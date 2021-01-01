# Contributor: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: loqs
# Contributor: Dede Dindin Qudsy <xtrymind+gmail+com>
# Contributor: Ike Devolder <ike.devolder+gmail+com>

pkgbase=nvidia-390xx
pkgname=(nvidia-390xx nvidia-390xx-dkms)
pkgver=390.138
pkgrel=10
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
        'kernel-5.8.patch'
        'kernel-5.9.patch'
        'https://gitlab.com/herecura/packages/nvidia-390xx-dkms/-/raw/db83ed8ac2e0e0097d535a82e2fd4ee0f31873e3/kernel-5.10.patch'
        'uvm_common-415.18.c')
b2sums=('bf56cef38d76accdf547b96cd444b0bd4288f604d44a1d274f3246c13310d6a59050b36f384280edb83938db81fa0544f7a2dc84ff6f440ff90b76ee62749fc1'
        '1d21307640a3844752c92e8344518daf6ad62d846689bebe6eed4dcadbf7b2e742862f5c17c0faee7256662cb75e62e124d59e5a5617e87324e1f0658f2b748d'
        'c68dc5d3bb659c4e9fc595d6e143677e58a4d564f171490a1cae85b58fb5860240d8dcafb8f314736bb5856a040d7439ce9595cefe61e3dbb7a9166ec7e76ad7'
        '7358919041a3d5df1cac50f6519b282abe7a344f07b59d52ab95a022ce0af12e743a1c194fd838b5733f3900e68c7f0756a528ac32255775f2ba830a2f052dec'
        '8d7c054ff08ed6212aa81f3db6597c1e016609bdddfb19161274e5e75b0ae8b5c5501740ca6a75367d152b16f8350319bd2577561aa796cfe49840c4bd2c2d5d'
        '4f61721cb9f3f76953c552ac8c131a592418078be63f98d43bd7248422cb2d88cfc1341f64b9124c7f102bf17635bb2734bd597b7b1011cc24223a5cc5fbf233')

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Use GPL2/MIT code directly from 415.18 release
    # https://www.nvidia.com/Download/driverResults.aspx/140282/en-us
    install -m644 ../uvm_common-415.18.c kernel/nvidia-uvm/uvm_common.c

    # Restore phys_to_dma support (still needed for 396.18) (and still needed for 390.138)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch

    # 5.8 Patch, Alberto Milone
    patch -Np1 -i ../kernel-5.8.patch

    # 5.9 Patch, from loqs
    patch -Np1 -i ../kernel-5.9.patch

    # 5.10 Patch, from xtrymind and BlackIkeEagle
    patch -Np1 -i ../kernel-5.10.patch

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
