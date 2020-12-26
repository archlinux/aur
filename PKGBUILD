# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vmaf-git
pkgver=2.0.0.r27.g9f5ecc65
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (git version)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'meson' 'nasm')
provides=('vmaf' 'libvmaf-git')
conflicts=('vmaf' 'libvmaf-git')
replaces=('libvmaf-git')
source=('git+https://github.com/Netflix/vmaf.git'
        '010-vmaf-skip-test_model.patch')
sha256sums=('SKIP'
            'dcdf877aa1d21d635ec003b0c703343f30dfb772e1f9033a2708e0fc3726f39f')

prepare() {
    patch -d vmaf -Np1 -i "${srcdir}/010-vmaf-skip-test_model.patch"
}

pkgver() {
    git -C vmaf describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
    install -D -m755 vmaf/libvmaf/build/tools/vmafossexec -t "${pkgdir}/usr/bin"
    install -D -m644 vmaf/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a vmaf/model "${pkgdir}/usr/share"
}
