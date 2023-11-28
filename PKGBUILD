# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vmaf-git
pkgver=3.0.0rc.r1.g97e50eae
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (git version)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'meson' 'nasm')
checkdepends=('vim')
provides=('vmaf' 'libvmaf-git')
conflicts=('vmaf' 'libvmaf-git')
replaces=('libvmaf-git')
source=('git+https://github.com/Netflix/vmaf.git')
sha256sums=('SKIP')

pkgver() {
    git -C vmaf describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/'
}

build() {
    arch-meson -Denable_avx512='false' vmaf/libvmaf build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 vmaf/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' vmaf/model "${pkgdir}/usr/share"
}
