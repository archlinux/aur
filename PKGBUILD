# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-giflib
pkgver=5.2.2
pkgrel=1
arch=('any')
pkgdesc="A library for reading and writing gif images (Android ${_android_arch})"
url="http://sourceforge.net/projects/giflib/"
license=("MIT")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config')
source=("https://downloads.sourceforge.net/project/giflib/giflib-${pkgver}.tar.gz"
        '0001-Unversioned-libs.patch')
md5sums=('913dd251492134e235ee3c9a91987a4d'
         '4009aa119ecad67d50f4350b7af83ddc')

prepare() {
    cd "${srcdir}"/giflib-${pkgver}
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
    patch -Np1 -i ../0001-Unversioned-libs.patch
}

build() {
    cd "${srcdir}"/giflib-${pkgver}
    source android-env ${_android_arch}

    make \
        libgif.a \
        libgif.so \
        CC=${ANDROID_CC} \
        AR=${ANDROID_AR} \
        $MAKEFLAGS
}

package() {
    cd "${srcdir}"/giflib-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install-include install-lib
    mkdir -p "${pkgdir}"/${ANDROID_PREFIX}
    mv -vf "${pkgdir}"/usr/local/* "${pkgdir}"/${ANDROID_PREFIX}/
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
