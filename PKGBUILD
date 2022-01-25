# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vmaf-git
pkgver=2.3.0.r89.g278f6aba
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (git version)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'meson' 'nasm' 'vim' 'doxygen')
provides=('vmaf' 'libvmaf-git')
conflicts=('vmaf' 'libvmaf-git')
replaces=('libvmaf-git')
options=('!lto')
source=('git+https://github.com/Netflix/vmaf.git')
sha256sums=('SKIP')

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
    cp -dr --no-preserve='ownership' vmaf/model "${pkgdir}/usr/share"
}
