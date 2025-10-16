# Maintainer : Jennifer Zhou <jennifer@jezh.me>
# Contributor : Daniel Bermond <dbermond@archlinux.org>

pkgbase=nvidia-open-tinygrad-git
pkgname='nvidia-open-tinygrad-dkms-git'
pkgver=580.95.05.r0.g2b436058a
pkgrel=1
pkgdesc='NVIDIA open GPU kernel modules (tinygrad git version)'
arch=('x86_64')
url='https://github.com/tinygrad/open-gpu-kernel-modules'
license=('MIT' 'GPL-2.0-only')
makedepends=('git' 'linux-headers')
options=('!buildflags' '!lto' '!strip')
source=('git+https://github.com/NVIDIA/open-gpu-kernel-modules.git#tag=580.95.05'
	'100-nvidia-open-tinygrad-p2p-changes.patch'
        '110-nvidia-open-change-dkms-conf.patch'
        '120-nvidia-open-linux-rt-gift.patch'
        '130-nvidia-open-reproducible-build.patch'
        '140-nvidia-open-gcc-sls.patch'
        '150-nvidia-open-make-modeset-fbdev-default.patch'
        '160-nvidia-open-linux6.15-fix.patch')
sha256sums=('SKIP'
	    '9a12756765111d5f8c9f720558bb0c000dd325557146f201fb9a0a4cd0dc3441'
            '009724e2e07b7be589ba455f225a9742d88a3a29383f2f220cb830ef4c8b7aea'
            'b0f62a78f749ff3a104197c12b6d885352adcf35fb5ecf00c4cd4c51b4195e45'
            '5340f33cdd19024a4501fee3d475af152c39f277d44422c65d447db263a0d501'
            '4393d135782b55d014b4c30b4c6327dedb85543844f5c299e66eec7dbd5667ba'
            'b7cb5ba0e6348f8310421134ddc815e58c5bef87e74ae2dabb240582ff0619ca'
            '4510eecef976c79ee4626fa5dbeecd316d554b5344c0e73503a47b1506e1d0af')

prepare() {
    patch -d open-gpu-kernel-modules -Np1 -i "${srcdir}/110-nvidia-open-change-dkms-conf.patch"
    patch -d open-gpu-kernel-modules -Np1 -i "${srcdir}/120-nvidia-open-linux-rt-gift.patch"
    patch -d open-gpu-kernel-modules -Np1 -i "${srcdir}/130-nvidia-open-reproducible-build.patch"
    patch -d open-gpu-kernel-modules -Np1 -i "${srcdir}/140-nvidia-open-gcc-sls.patch"
    patch -d open-gpu-kernel-modules -Np1 -i "${srcdir}/150-nvidia-open-make-modeset-fbdev-default.patch"
    patch -d open-gpu-kernel-modules -Np1 -i "${srcdir}/160-nvidia-open-linux6.15-fix.patch"
    
    sed -i "s/__VERSION_STRING/${pkgver%%.r*}/" open-gpu-kernel-modules/kernel-open/dkms.conf
    
    [ -d dkms-src ] && rm -rf dkms-src
    cp -af open-gpu-kernel-modules/kernel-open dkms-src
}

pkgver() {
    git -C open-gpu-kernel-modules describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    sed -i "s/__VERSION_STRING/${pkgver}/" {open-gpu-kernel-modules/kernel-open,dkms-src}/dkms.conf
    
    local -x KERNEL_UNAME
    
    # allow usage of custom kernel and building in a chroot
    if [ -d "/usr/lib/modules/$(uname -r)" ]; then
        KERNEL_UNAME="$(uname -r)"
    else
        KERNEL_UNAME="$(find /usr/lib/modules -mindepth 1 -maxdepth 1 -type d | sed -n 's|.*/||;1p')"
    fi
    
    unset -v SYSSRC
    make -C open-gpu-kernel-modules modules
}


package() {
    pkgdesc="$(sed 's/(\(git[[:space:]]version\)/(sources; \1/' <<< "$pkgdesc")"
    depends=('dkms' 'libglvnd' "nvidia-utils>=$(sed 's/\.r.*//;s/\.[^\.]*$//' <<< "$pkgver")")
    provides=("nvidia-open=${pkgver}" 'NVIDIA-MODULE')
    conflicts=('nvidia-open' 'NVIDIA-MODULE')
    
    install -D -m644 open-gpu-kernel-modules/src/nvidia/_out/Linux_x86_64/nv-kernel.o \
        dkms-src/nvidia/nv-kernel.o_binary
    install -D -m644 open-gpu-kernel-modules/src/nvidia-modeset/_out/Linux_x86_64/nv-modeset-kernel.o \
        dkms-src/nvidia-modeset/nv-modeset-kernel.o_binary
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' dkms-src "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 open-gpu-kernel-modules/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m644 <(printf '%s\n' 'options nvidia NVreg_OpenRmEnableUnsupportedGpus=1') "${pkgdir}/usr/lib/modprobe.d/nvidia-open.conf"
}
