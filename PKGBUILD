# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=nvidia-open-beta
pkgname=(
    'nvidia-open-beta'
    'nvidia-open-beta-dkms')
pkgver=590.44.01
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
        '140-nvidia-open-gcc-sls.patch'
        '150-nvidia-open-make-modeset-fbdev-default.patch')
sha256sums=('8ef621af31e017887b16f8901bb7ee944f051a85997c1550c5daa8fbd6ec118b'
            'b41f452930d0cf38b8806e402c78c8a5179031b702c29a1e63391ca1120af1e6'
            'b0f62a78f749ff3a104197c12b6d885352adcf35fb5ecf00c4cd4c51b4195e45'
            '5340f33cdd19024a4501fee3d475af152c39f277d44422c65d447db263a0d501'
            'b498128faffe3b7ccdf210b5cdbb8da75b8e3a381d2c9b82355c344405e4e916'
            '5f457abcb62de09148c14ceca060243c2c1152485dd99323641c2077f47d5a5e')

prepare() {
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/110-nvidia-open-change-dkms-conf.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/120-nvidia-open-linux-rt-gift.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/130-nvidia-open-reproducible-build.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/140-nvidia-open-gcc-sls.patch"
    patch -d "NVIDIA-kernel-module-source-${pkgver}" -Np1 -i "${srcdir}/150-nvidia-open-make-modeset-fbdev-default.patch"
    
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
