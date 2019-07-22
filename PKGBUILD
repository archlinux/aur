# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-l-smash
pkgver=2.14.5
pkgrel=1
arch=('any')
pkgdesc='MP4 muxer and other tools (android)'
license=('custom')
url='https://github.com/l-smash/l-smash'
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/l-smash/l-smash/archive/v${pkgver}.tar.gz"
        "clang.patch")
sha256sums=('e6f7c31de684f4b89ee27e5cd6262bf96f2a5b117ba938d2d606cf6220f05935'
            'SKIP')

prepare() {
    cd "${srcdir}"/l-smash-${pkgver}
    patch -Np1 -i ../clang.patch
}

build() {
    cd "${srcdir}"/l-smash-${pkgver}
    source android-env ${_android_arch}

    ./configure \
        --prefix=${ANDROID_PREFIX} \
        --cc=${ANDROID_CC} \
        --cross-prefix=${ANDROID_TOOLS_PREFIX} \
        --sysroot=${ANDROID_SYSROOT} \
        --enable-shared \
        --extra-cflags="$CFLAGS" \
        --extra-ldflags="$LDFLAGS"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/l-smash-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
