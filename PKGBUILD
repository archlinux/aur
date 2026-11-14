# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qoa-git
pkgver=r97.93b0680
pkgrel=1
pkgdesc='Quite OK Audio (QOA) format and codec (git version)'
arch=('x86_64')
url='https://qoaformat.org/'
license=('MIT')
depends=(
    'alsa-lib'
    'glibc')
makedepends=(
    'dr_libs-git'
    'git'
    'sokol-git')
provides=('qoa')
conflicts=('qoa')
source=('git+https://github.com/phoboslab/qoa.git'
        '010-qoa-use-arch-flags.patch'
        '020-qoa-gcc14-fix.patch')
sha256sums=('SKIP'
            'e7ef5040b3221cc4d7bea4a2efbc9f70a4b76260f419b3c9c4a97cd266cb8d2e'
            'becc65cf15c73b4e97fde0dd745a3ffd52c29d7ef7e6868d05e2195b83ee21af')

prepare() {
    patch -d qoa -Np1 -i "${srcdir}/010-qoa-use-arch-flags.patch"
    patch -d qoa -Np1 -i "${srcdir}/020-qoa-gcc14-fix.patch"
}

pkgver() {
    printf 'r%s.%s' "$(git -C qoa rev-list --count HEAD)" "$(git -C qoa rev-parse --short HEAD)"
}

build() {
    export CFLAGS+=' -isystem/usr/include/dr_libs'
    export CFLAGS+=' -DSAUDIO_USE_ALSA'
    make -C qoa HAS_DRLIBS='true'
}

package() {
    install -D -m755 qoa/qoa{conv,play} -t "${pkgdir}/usr/bin"
    install -D -m644 qoa/qoa.h -t "${pkgdir}/usr/include"
    install -D -m644 qoa/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
