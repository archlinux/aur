# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det

pkgname=egl-wayland-git
pkgver=1.1.8.r0.gce4c963
pkgrel=2
pkgdesc='EGLStream-based Wayland external platform (git version)'
arch=('x86_64')
url='https://github.com/NVIDIA/egl-wayland/'
license=('MIT')
depends=('wayland')
makedepends=('git' 'meson' 'eglexternalplatform' 'libglvnd>=1.3.4' 'wayland-protocols')
provides=('egl-wayland' 'libnvidia-egl-wayland.so')
conflicts=('egl-wayland')
source=('git+https://github.com/NVIDIA/egl-wayland.git'
        '10_nvidia_wayland.json'
        '15_nvidia_gbm.json')
sha256sums=('SKIP'
            '5cccf1905a266e8e34d5ad4aad4be85390e60b1a0850a29dd9d64adc641de412'
            'be0e01a28300d80ea9a326718d4bdc45eb1ec5d80482a8f6e69e9e1594a5f196')

pkgver() {
    git -C egl-wayland describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    arch-meson build egl-wayland
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir" ninja install -C build
    cp -dr --no-preserve='ownership' egl-wayland/include "${pkgdir}/usr"
    install -D -m644 10_nvidia_wayland.json -t "${pkgdir}/usr/share/egl/egl_external_platform.d"
    install -D -m644 15_nvidia_gbm.json -t "${pkgdir}/usr/share/egl/egl_external_platform.d"
    install -D -m644 egl-wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
