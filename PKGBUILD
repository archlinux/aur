# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vmaf-git
pkgver=1.3.15.r79.g12386f2
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (git version)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'meson')
provides=('vmaf' 'libvmaf-git')
conflicts=('vmaf' 'libvmaf-git')
replaces=('libvmaf-git')
source=('git+https://github.com/Netflix/vmaf.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p vmaf/libvmaf/build
}

pkgver() {
    cd vmaf
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    arch-meson vmaf/libvmaf/build vmaf/libvmaf
    ninja -v -C vmaf/libvmaf/build
}

check() {
    ninja -v -C vmaf/libvmaf/build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C vmaf/libvmaf/build install
    
    local _bin
    install -D -m755 vmaf/libvmaf/build/tools/vmaf -t "${pkgdir}/usr/bin"
    for _bin in moment ms_ssim psnr ssim
    do
        install -D -m755 "vmaf/libvmaf/build/tools/${_bin}" "${pkgdir}/usr/bin/vmaf-${_bin}"
    done
}
