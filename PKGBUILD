# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qoa-git
pkgver=r49.9a3d52f
pkgrel=1
pkgdesc='Quite OK Audio (QOA) format and codec (git version)'
arch=('x86_64')
url='https://qoaformat.org/'
license=('MIT')
depends=('alsa-lib')
makedepends=('git' 'dr_libs-git' 'sokol-git')
provides=('qoa')
conflicts=('qoa')
source=('git+https://github.com/phoboslab/qoa.git'
        '010-qoa-use-arch-flags.patch')
sha256sums=('SKIP'
            '88decb9b90164b7377b51aa2c6ca183198feb365438ad935985e0024bce1fe7a')

prepare() {
    patch -d qoa -Np1 -i "${srcdir}/010-qoa-use-arch-flags.patch"
}

pkgver() {
    printf 'r%s.%s' "$(git -C qoa rev-list --count HEAD)" "$(git -C qoa rev-parse --short HEAD)"
}

build() {
    CFLAGS+=' -I/usr/include/dr_libs' make -C qoa
}

package() {
    install -D -m755 qoa/qoa{conv,play} -t "${pkgdir}/usr/bin"
    install -D -m644 qoa/qoa.h -t "${pkgdir}/usr/include"
    install -D -m644 qoa/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
