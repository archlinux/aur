# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=nvidia-open-beta
pkgname=(
    'nvidia-open-beta'
    'nvidia-open-beta-dkms')
pkgver=595.45.04
pkgrel=1
epoch=1
pkgdesc='NVIDIA open kernel modules (beta version)'
arch=('x86_64')
url='https://github.com/NVIDIA/open-gpu-kernel-modules/'
license=('MIT AND GPL-2.0-only')
makedepends=(
    'linux-headers')
options=('!buildflags' '!lto' '!strip')
source=("https://download.nvidia.com/XFree86/NVIDIA-kernel-module-source/NVIDIA-kernel-module-source-${pkgver}.tar.xz"
        '110-nvidia-open-change-dkms-conf.patch'
        '120-nvidia-open-linux-rt-gift.patch'
        '130-nvidia-open-reproducible-build.patch'
        '140-nvidia-open-gcc-sls.patch')
sha256sums=('6c770892b7e93130660ccfd80231be39ca785592c97910bbbe967f8f613d1125'
            'a037e83c5d0255a547229f03f7a7cd94443de59e97821e37c1cfb5a3b32a11a8'
            'b0f62a78f749ff3a104197c12b6d885352adcf35fb5ecf00c4cd4c51b4195e45'
            '5340f33cdd19024a4501fee3d475af152c39f277d44422c65d447db263a0d501'
            'b498128faffe3b7ccdf210b5cdbb8da75b8e3a381d2c9b82355c344405e4e916')

prepare() {
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/110-nvidia-open-change-dkms-conf.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/120-nvidia-open-linux-rt-gift.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/130-nvidia-open-reproducible-build.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/140-nvidia-open-gcc-sls.patch"
    
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

package_nvidia-open-beta() {
    depends=(
        'libglvnd'
        'linux'
        "nvidia-utils-beta>=${pkgver%.*}")
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
    
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/kernel-open"/*.ko -t "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +
    
    install -D -m644 <(printf '%s\n' 'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1') "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
}

package_nvidia-open-beta-dkms() {
    pkgdesc="$(sed 's/(\(beta[[:space:]]version\)/(module sources; \1/' <<< "$pkgdesc")"
    depends=(
        'dkms'
        'libglvnd'
        "nvidia-utils-beta>=${pkgver%.*}")
    provides=("nvidia-open=${pkgver}" 'NVIDIA-MODULE')
    conflicts=('nvidia-open' 'NVIDIA-MODULE')
    
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/src/nvidia/_out/Linux_x86_64/nv-kernel.o" \
        dkms-src/nvidia/nv-kernel.o_binary
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/src/nvidia-modeset/_out/Linux_x86_64/nv-modeset-kernel.o" \
        dkms-src/nvidia-modeset/nv-modeset-kernel.o_binary
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' dkms-src "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "NVIDIA-kernel-module-source-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m644 <(printf '%s\n' 'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1') "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
}
