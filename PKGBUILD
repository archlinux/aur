# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-bzip2
pkgver=1.0.6
pkgrel=2
pkgdesc="A high-quality data compression program (android)"
arch=('any')
url="http://sources.redhat.com/bzip2"
license=("custom")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config')
source=("https://fossies.org/linux/misc/bzip2-${pkgver}.tar.gz")
sha1sums=('3f89f861209ce81a6bab1fd1998c0ef311712002')

prepare() {
    cd "$srcdir/bzip2-$pkgver"
}

build() {
    cd "$srcdir"/bzip2-$pkgver

    make libbz2.a \
        CC=${ANDROID_CC} \
        AR=${ANDROID_AR} \
        RANLIB=${ANDROID_RANLIB} \
        PREFIX=${ANDROID_PREFIX} \
        $MAKEFLAGS
}

package() {
    cd "$srcdir"/bzip2-$pkgver

    install -m755 -d "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}
    install -m644 bzlib.h "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/
    install -m755 -d "${pkgdir}"/${ANDROID_PREFIX_LIB}
    install -m644 libbz2.a "${pkgdir}"/${ANDROID_PREFIX_LIB}/
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
