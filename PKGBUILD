# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-jbigkit
pkgver=2.1
pkgrel=2
arch=('any')
pkgdesc="Data compression library/utilities for bi-level high-resolution images (Android ${_android_arch})"
url="https://www.cl.cam.ac.uk/~mgk25/jbigkit/"
license=('GPL-2.0-or-later')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.cl.cam.ac.uk/~mgk25/download/jbigkit-${pkgver}.tar.gz")
md5sums=('ebcf09bed9f14d7fa188d3bd57349522')

build() {
    cd "${srcdir}/jbigkit-${pkgver}"
    source android-env ${_android_arch}

    make -C libjbig $MAKEFLAGS CC=${ANDROID_CC} CFLAGS="${ANDROID_CFLAGS} -fPIC" libjbig.a libjbig85.a
    ${ANDROID_CC} -shared -o libjbig/libjbig.so libjbig/jbig.o libjbig/jbig_ar.o ${ANDROID_LDFLAGS}
    ${ANDROID_CC} -shared -o libjbig/libjbig85.so libjbig/jbig85.o libjbig/jbig_ar.o ${ANDROID_LDFLAGS}
}

package() {
    cd "${srcdir}/jbigkit-${pkgver}"
    source android-env ${_android_arch}

    install -vDm 644 libjbig/*.h -t "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/"
    install -vDm 755 libjbig/*.so -t "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    install -vDm 755 libjbig/*.a -t "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
