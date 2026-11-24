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
pkgver=620.73.04
pkgrel=1
epoch=1
pkgdesc='NVIDIA open kernel modules with thunderbolt 4 force egpu and hotplug patches'
arch=('x86_64')
url='https://github.com/NVIDIA/open-gpu-kernel-modules'
license=('MIT AND GPL-2.0-only')
makedepends=()  # Requires kernel headers matching your kernel (linux-headers, linux-cachyos-headers, etc.)
options=('!buildflags' '!lto' '!strip')
install=nvidia-open-egpu.install
source=("https://download.nvidia.com/XFree86/NVIDIA-kernel-module-source/NVIDIA-kernel-module-source-${pkgver}.tar.xz"
        '110-nvidia-open-change-dkms-conf.patch'
        '120-nvidia-open-linux-rt-gift.patch'
        '130-nvidia-open-reproducible-build.patch'
        '140-nvidia-open-gcc-sls.patch'
        '160-nvidia-open-thunderbolt-egpu-hotplug.patch'
        '170-nvidia-open-force-external-gpu.patch'
        '180-nvidia-open-bar1-unmap-overhang.patch'
        '190-nvidia-open-bar1-kernel-client-contiguous.patch'
        '200-nvidia-open-rebar-failure-nonfatal.patch'
        '210-nvidia-open-bar1-mapping-reuse.patch'
        '220-nvidia-open-procfs-external-gpu.patch'
        'nvidia-egpu-hotplug.rules'
        'nvidia-egpu-hotplug.sh')
sha256sums=('3a107b31b22d6f5c8da34e5e22a66e38ccdb7a92ee23266d0e064d3b9635c93f'
            '70a13159e43b78df1fb03601cd594d9c39893e8351b0318daa7a3cf1fd692738'
            'b0f62a78f749ff3a104197c12b6d885352adcf35fb5ecf00c4cd4c51b4195e45'
            '607fa6d1cc79a6cee76dcbd2035078269b33d3a2db943ab4e0981cd4acd5da15'
            'ea282df2d5dcc85a402c084aba90e60b78df2af0be922d75ee068bf437c13f91'
            '0e9a89b484b6b38548a2e207308e28b6c27477d9b8f2a92c3a33e3541697a4af'
            'd507ad460af2f97a82ddea29ce28e03dab16ef997cbdf53a0a890c344ce05096'
            '3bfd672d6d38956d35a0673234704eb3cdf28ff345b0463c15aab0a21c147bcf'
            '6dc2f757334e4aed649087aa2dd345e1c5d768fe38a6fa1dda8ff4cd0cdc7ee3'
            'b050581e401adcb826c47e8ced7bcc9a7d6e01e351e06ae4c27f3ecd5a726764'
            '85c9dd29bca475e4d8d816191bb36d4a8c67f76a074c67c2928a0683ca3fef42'
            '5a2ef1ba7b4bd4c2d066c03a1d0956c4f65f434ac854ce735eb1a62ef02ca476'
            '570f66dd11212511193ddadf606dcda611a72584b3bf86c6e55273a6b7945567'
            'dfbdc05ccc3af945d8429b46f06f3b6b81ecf27144dd21272109f3912e7e27b0')

prepare() {
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/110-nvidia-open-change-dkms-conf.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/120-nvidia-open-linux-rt-gift.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/130-nvidia-open-reproducible-build.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/140-nvidia-open-gcc-sls.patch"
    # Thunderbolt eGPU hotplug support: https://github.com/bdandy/open-gpu-kernel-modules/tree/fix/hotunplug
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/160-nvidia-open-thunderbolt-egpu-hotplug.patch"
    # https://github.com/NVIDIA/open-gpu-kernel-modules/pull/984 - force eGPU mode for TB4/5 enclosures
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/170-nvidia-open-force-external-gpu.patch"

    # BAR1 mapping fixes: https://github.com/NVIDIA/open-gpu-kernel-modules/pull/1354 and #1403
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/180-nvidia-open-bar1-unmap-overhang.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/190-nvidia-open-bar1-kernel-client-contiguous.patch"

    # Preserve normal ReBAR attempts and continue probing if resize fails: PR #1109
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/200-nvidia-open-rebar-failure-nonfatal.patch"
    # BAR1 mapping reuse cleanup from PR #1426 (source file only)
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/210-nvidia-open-bar1-mapping-reuse.patch"
    # Export NVIDIA's existing eGPU classification for the hotplug handler.
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/220-nvidia-open-procfs-external-gpu.patch"
    
    # Substitute version placeholder in dkms.conf
    sed -i "s/@@PKGVER@@/${pkgver}/" "NVIDIA-kernel-module-source-${pkgver}/kernel-open/dkms.conf"

    # Kbuild emits LLVM bitcode objects for ThinLTO kernels. Select the
    # matching linker for each DKMS target while retaining GNU ld for kernels
    # that do not use LLD.
    if ! grep -q '^MAKE\[0\].* LD=' "NVIDIA-kernel-module-source-${pkgver}/kernel-open/dkms.conf"; then
        sed -i \
            's| KERNEL_UNAME=${kernelver} modules"| LD=$(if grep -qs ^CONFIG_LD_IS_LLD=y /lib/modules/${kernelver}/build/.config; then echo ld.lld; else echo ld; fi) KERNEL_UNAME=${kernelver} modules"|' \
            "NVIDIA-kernel-module-source-${pkgver}/kernel-open/dkms.conf"
    fi
    
    [ -d dkms-src ] && rm -rf dkms-src
    cp -a "NVIDIA-kernel-module-source-${pkgver}/kernel-open" dkms-src
}

build() {
    local -x KERNEL_UNAME
    local _ld
    
    # allow usage of custom kernel and building in a chroot
    if [ -d "/usr/lib/modules/$(uname -r)" ]
    then
        KERNEL_UNAME="$(uname -r)"
    else
        KERNEL_UNAME="$(find /usr/lib/modules -mindepth 1 -maxdepth 1 -type d | sed -n 's|.*/||;1p')"
    fi
    
    unset -v SYSSRC

    # Fix build issues with kernels that use ThinLTO (cachyos)
    if grep -qs '^CONFIG_LD_IS_LLD=y' "/usr/lib/modules/${KERNEL_UNAME}/build/.config"; then
        _ld=ld.lld
    else
        _ld=ld
    fi

    make -C "NVIDIA-kernel-module-source-${pkgver}" modules LD="${_ld}"
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
    
    install -D -m644 <(
        printf '%s\n' \
            '# Load NVIDIA modules through the eGPU udev handler.' \
            'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1' \
            'blacklist nvidia' \
            'blacklist nvidia-drm' \
            'blacklist nvidia-uvm' \
            'blacklist nvidia-modeset' \
            'blacklist nvidia-nvlink' \
            'blacklist nouveau'
    ) "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
    
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
    
    install -D -m644 <(
        printf '%s\n' \
            '# Load NVIDIA modules through the eGPU udev handler.' \
            'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1' \
            'blacklist nvidia' \
            'blacklist nvidia-drm' \
            'blacklist nvidia-uvm' \
            'blacklist nvidia-modeset' \
            'blacklist nvidia-nvlink' \
            'blacklist nouveau'
    ) "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
    
    # eGPU hotplug support: udev rules and handler script
    install -D -m644 "${srcdir}/nvidia-egpu-hotplug.rules" "${pkgdir}/usr/lib/udev/rules.d/90-nvidia-egpu-hotplug.rules"
    install -D -m755 "${srcdir}/nvidia-egpu-hotplug.sh" "${pkgdir}/usr/lib/nvidia-egpu/nvidia-egpu-hotplug.sh"
}
