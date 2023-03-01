# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgbase=nvidia-open-beta
pkgname=('nvidia-open-beta' 'nvidia-open-beta-dkms')
pkgver=530.30.02
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
sha256sums=('ed4732226a2f0002dcebc49532b25b859b95f8e236782c539499ebb039afd9f2'
            '8b784f2218d6a1ab80b6ba0fb27b6ad2176129a8b54728033896739b23449745'
            'b0f62a78f749ff3a104197c12b6d885352adcf35fb5ecf00c4cd4c51b4195e45'
            '5916c0250a45a216f407f79fb2f44323eae0895804812c428baa98113afc1339'
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
    depends=('linux' 'libglvnd' "nvidia-utils-beta>=${pkgver%.*}")
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
    depends=('dkms' 'libglvnd' "nvidia-utils-beta>=${pkgver%.*}")
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
