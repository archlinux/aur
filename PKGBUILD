# Maintainer: Bohdan Dymchenko <dmbohdan@gmail.com>
# NOTE: This package requires headers matching your kernel.
# For linux: install linux-headers
# For linux-lts: install linux-lts-headers  
# For linux-zen: install linux-zen-headers
# For linux-cachyos: install linux-cachyos-headers
# For linux-cachyos-lts: install linux-cachyos-lts-headers
# etc.

pkgbase=nvidia-open-egpu
pkgname=(
    'nvidia-open-egpu'
    'nvidia-open-egpu-dkms')
pkgver=590.48.01
pkgrel=1
epoch=1
pkgdesc='NVIDIA open kernel modules with Thunderbolt eGPU hotplug support'
arch=('x86_64')
url='https://github.com/NVIDIA/open-gpu-kernel-modules'
license=('MIT AND GPL-2.0-only')
makedepends=()  # Requires kernel headers matching your kernel (linux-headers, linux-cachyos-headers, etc.)
options=('!buildflags' '!lto' '!strip')
source=("https://download.nvidia.com/XFree86/NVIDIA-kernel-module-source/NVIDIA-kernel-module-source-${pkgver}.tar.xz"
        '110-nvidia-open-change-dkms-conf.patch'
        '120-nvidia-open-linux-rt-gift.patch'
        '130-nvidia-open-reproducible-build.patch'
        '140-nvidia-open-gcc-sls.patch'
        '150-nvidia-open-make-modeset-fbdev-default.patch'
        '160-nvidia-open-thunderbolt-egpu-hotplug.patch'
        '170-nvidia-open-force-external-gpu.patch'
        'nvidia-egpu-hotplug.rules'
        'nvidia-egpu-hotplug.sh')
sha256sums=('ffcd948cfe32bb0655fc911b8204ae6df086346025dd644d559a9b148297a80d'
            '70a13159e43b78df1fb03601cd594d9c39893e8351b0318daa7a3cf1fd692738'
            'b0f62a78f749ff3a104197c12b6d885352adcf35fb5ecf00c4cd4c51b4195e45'
            '5340f33cdd19024a4501fee3d475af152c39f277d44422c65d447db263a0d501'
            'b498128faffe3b7ccdf210b5cdbb8da75b8e3a381d2c9b82355c344405e4e916'
            '5f457abcb62de09148c14ceca060243c2c1152485dd99323641c2077f47d5a5e'
        'c46432c10af67bd1347c8b00c655fb8d9de3304aed9409c4f2cfaeb5346c8c0b'
        'fb18cacdf323f985208dae3fcd174c9f6aad42a77d06229be082849a9d7d9f42'
        'f502e8062d6458792a08d54479eb82d16592e1981e46f3e9e3838cd7a3bd03eb'
        '31a057be4dce6e4e9587adf317cf2ed9df1dd2968e1e2866bad4e9fd7a6f47eb')

prepare() {
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/110-nvidia-open-change-dkms-conf.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/120-nvidia-open-linux-rt-gift.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/130-nvidia-open-reproducible-build.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/140-nvidia-open-gcc-sls.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/150-nvidia-open-make-modeset-fbdev-default.patch"
    # Thunderbolt eGPU hotplug support: https://github.com/bdandy/open-gpu-kernel-modules/tree/fix/hotunplug
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/160-nvidia-open-thunderbolt-egpu-hotplug.patch"
    # https://github.com/NVIDIA/open-gpu-kernel-modules/pull/984 - force eGPU mode for TB4/5 enclosures
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/170-nvidia-open-force-external-gpu.patch"
    
    # Substitute version placeholder in dkms.conf
    sed -i "s/@@PKGVER@@/${pkgver}/" "NVIDIA-kernel-module-source-${pkgver}/kernel-open/dkms.conf"
    
    [ -d dkms-src ] && rm -rf dkms-src
    cp -a "NVIDIA-kernel-module-source-${pkgver}/kernel-open" dkms-src
}

build() {
    local -x KERNEL_UNAME
    
    # allow usage of custom kernel and building in a chroot
    if [ -d "/usr/lib/modules/$(uname -r)" ]
    then
        KERNEL_UNAME="$(uname -r)"
    else
        KERNEL_UNAME="$(find /usr/lib/modules -mindepth 1 -maxdepth 1 -type d | sed -n 's|.*/||;1p')"
    fi
    
    unset -v SYSSRC
    make -C "NVIDIA-kernel-module-source-${pkgver}" modules
}

package_nvidia-open-egpu() {
    depends=(
        'libglvnd'
        'linux'
        "nvidia-utils>=${pkgver}")
    provides=("nvidia-open=${pkgver}" 'NVIDIA-MODULE')
    conflicts=('nvidia-open' 'nvidia-open-dkms' 'nvidia-open-egpu-dkms' 'NVIDIA-MODULE')
    
    local _kernver
    if [ -d "/usr/lib/modules/$(uname -r)" ]
    then
        _kernver="$(<"/usr/lib/modules/$(uname -r)/build/version")"
    else
        _kernver="$(find /usr/lib/modules -mindepth 1 -maxdepth 1 -type d | head -n1)"
        _kernver="$(<"/usr/lib/modules/${_kernver##*/}/build/version")"
    fi
    
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/kernel-open"/*.ko -t "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +
    
    install -D -m644 <(printf '%s\n' 'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1') "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
    
    # eGPU hotplug support: udev rules and handler script
    install -D -m644 "${srcdir}/nvidia-egpu-hotplug.rules" "${pkgdir}/usr/lib/udev/rules.d/90-nvidia-egpu-hotplug.rules"
    install -D -m755 "${srcdir}/nvidia-egpu-hotplug.sh" "${pkgdir}/usr/lib/nvidia-egpu/nvidia-egpu-hotplug.sh"
}

package_nvidia-open-egpu-dkms() {
    pkgdesc="$(sed 's/(with Thunderbolt eGPU hotplug support/(Thunderbolt eGPU hotplug support; module sources/' <<< "$pkgdesc")"
    depends=(
        'dkms'
        'libglvnd'
        "nvidia-utils>=${pkgver}")
    provides=("nvidia-open=${pkgver}" 'NVIDIA-MODULE')
    conflicts=('nvidia-open' 'nvidia-open-dkms' 'nvidia-open-egpu' 'NVIDIA-MODULE')
    
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/src/nvidia/_out/Linux_x86_64/nv-kernel.o" \
        dkms-src/nvidia/nv-kernel.o_binary
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/src/nvidia-modeset/_out/Linux_x86_64/nv-modeset-kernel.o" \
        dkms-src/nvidia-modeset/nv-modeset-kernel.o_binary
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' dkms-src "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m644 <(printf '%s\n' 'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1') "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
    
    # eGPU hotplug support: udev rules and handler script
    install -D -m644 "${srcdir}/nvidia-egpu-hotplug.rules" "${pkgdir}/usr/lib/udev/rules.d/90-nvidia-egpu-hotplug.rules"
    install -D -m755 "${srcdir}/nvidia-egpu-hotplug.sh" "${pkgdir}/usr/lib/nvidia-egpu/nvidia-egpu-hotplug.sh"
}
