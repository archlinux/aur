# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vmaf-git
pkgver=1.5.3.r126.gca93c006
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
            '9e116b0a6a9b668c4f1d62929b7a0ab989bda97d5a57c41aad17668ae361f97c')

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
