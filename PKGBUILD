# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-giflib
pkgver=5.1.9
pkgrel=2
pkgdesc="A library for reading and writing gif images (android)"
arch=('any')
url="http://sourceforge.net/projects/giflib/"
license=("MIT")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config')
source=("http://downloads.sourceforge.net/sourceforge/giflib/giflib-${pkgver}.tar.bz2"
        'Makefile.patch')
md5sums=('c1df79d223b10b92f44ca649ef5f1459'
         '0c6a08273d51f7fd965c79c967f5e7ed')

prepare() {
    cd "${srcdir}"/giflib-${pkgver}

    check_ndk_version_ge_than 18.0
    patch -Np1 -i "../Makefile.patch"
}

build() {
    cd "${srcdir}"/giflib-${pkgver}

    make \
        libgif.a \
        libgif.so \
        CC=${ANDROID_CC} \
        AR=${ANDROID_AR} \
        $MAKEFLAGS
}

package() {
    cd "${srcdir}"/giflib-${pkgver}

    make DESTDIR="$pkgdir" install-include install-lib
    mkdir -p "${pkgdir}"/${ANDROID_PREFIX}
    mv -vf "${pkgdir}"/usr/local/* "${pkgdir}"/${ANDROID_PREFIX}/
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
