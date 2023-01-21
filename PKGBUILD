# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgbase=nvidia-open-beta
pkgname=('nvidia-open-beta' 'nvidia-open-beta-dkms')
pkgver=525.85.05
pkgrel=1
pkgdesc='NVIDIA open GPU kernel modules (beta version)'
arch=('x86_64')
url='https://github.com/NVIDIA/open-gpu-kernel-modules/'
license=('MIT' 'GPL2')
makedepends=('linux-headers')
options=('!buildflags' '!lto' '!strip')
source=("https://github.com/NVIDIA/open-gpu-kernel-modules/archive/${pkgver}/nvidia-open-${pkgver}.tar.gz"
        '110-nvidia-open-change-dkms-conf.patch'
        '120-nvidia-open-linux-rt-gift.patch'
        '130-nvidia-open-reproducible-build.patch'
        '140-nvidia-open-gcc-sls.patch')
sha256sums=('295b7282453f6f40bbe8ac1e15757ee91d0da9a91ac26c8140b3df7b1785664c'
            '00256d7de2ca3fcd199ae4bd10026cc6423839b5a3cbf13afbbd2348f5221cca'
            'b0f62a78f749ff3a104197c12b6d885352adcf35fb5ecf00c4cd4c51b4195e45'
            'e305ea7aa40b028887621d5149727023d09461c87e82961adecbfbc271924f48'
            'baa891c56747a4862f64f3259aebcaf24beade8d850a77468f92d4f9bbf6cd7f')

prepare() {
    patch -d "open-gpu-kernel-modules-${pkgver}" -Np1 -i "${srcdir}/110-nvidia-open-change-dkms-conf.patch"
    patch -d "open-gpu-kernel-modules-${pkgver}" -Np1 -i "${srcdir}/120-nvidia-open-linux-rt-gift.patch"
    patch -d "open-gpu-kernel-modules-${pkgver}" -Np1 -i "${srcdir}/130-nvidia-open-reproducible-build.patch"
    patch -d "open-gpu-kernel-modules-${pkgver}" -Np1 -i "${srcdir}/140-nvidia-open-gcc-sls.patch"
    
    [ -d dkms-src ] && rm -rf dkms-src
    cp -a "open-gpu-kernel-modules-${pkgver}/kernel-open" dkms-src
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
    make -C "open-gpu-kernel-modules-${pkgver}" modules
}

package_nvidia-open-beta() {
    depends=('linux' "nvidia-utils-beta=${pkgver}" 'libglvnd')
    provides=("nvidia-open=${pkgver}" 'NVIDIA-MODULE')
    conflicts=('nvidia-open' 'NVIDIA-MODULE')
    
    local _kernver
    if [ -d "/usr/lib/modules/$(uname -r)" ]
    then
        _kernver="$(<"/usr/lib/modules/$(uname -r)/build/version")"
    else
        _kernver="$(find /usr/lib/modules -mindepth 1 -maxdepth 1 -type d | head -n1)"
        _kernver="$(<"/usr/lib/modules/${_kernver##*/}/build/version")"
    fi
    
    install -D -m644 "open-gpu-kernel-modules-${pkgver}/kernel-open"/*.ko -t "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"
    install -D -m644 "open-gpu-kernel-modules-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find "$pkgdir" -name '*.ko' -exec strip --strip-debug {} +
    find "$pkgdir" -name '*.ko' -exec xz -T1 {} +
    
    install -D -m644 <(printf '%s\n' 'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1') "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
}

package_nvidia-open-beta-dkms() {
    pkgdesc="$(sed 's/(\(beta[[:space:]]version\)/(sources; \1/' <<< "$pkgdesc")"
    depends=('dkms' "nvidia-utils-beta=${pkgver}" 'libglvnd')
    provides=("nvidia-open=${pkgver}" 'NVIDIA-MODULE')
    conflicts=('nvidia-open' 'NVIDIA-MODULE')
    
    install -D -m644 "open-gpu-kernel-modules-${pkgver}/src/nvidia/_out/Linux_x86_64/nv-kernel.o" \
        dkms-src/nvidia/nv-kernel.o_binary
    install -D -m644 "open-gpu-kernel-modules-${pkgver}/src/nvidia-modeset/_out/Linux_x86_64/nv-modeset-kernel.o" \
        dkms-src/nvidia-modeset/nv-modeset-kernel.o_binary
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' dkms-src "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "open-gpu-kernel-modules-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m644 <(printf '%s\n' 'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1') "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
}
