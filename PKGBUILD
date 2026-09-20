# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=riscv64

pkgname=android-${_android_arch}-giflib
pkgver=6.1.3
pkgrel=1
arch=('any')
pkgdesc="A library for reading and writing gif images (Android ${_android_arch})"
url="http://sourceforge.net/projects/giflib/"
license=("MIT")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config')
source=("https://downloads.sourceforge.net/giflib/giflib-${pkgver}.tar.gz"
        '0001-Unversioned-libs.patch')
md5sums=('a70e90ff780e9ebee9cb84b82bbd46a7'
         'e4cbb7f832d22a24018799918295032e')

prepare() {
    cd "${srcdir}/giflib-${pkgver}"
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
    patch -Np1 -i ../0001-Unversioned-libs.patch
}

build() {
    cd "${srcdir}/giflib-${pkgver}"
    source android-env ${_android_arch}

    make \
        libgif.a \
        libgif.so \
        CC=${ANDROID_CC} \
        AR=${ANDROID_AR} \
        $MAKEFLAGS
}

package() {
    cd "${srcdir}/giflib-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install-include install-lib
    mkdir -p "${pkgdir}/${ANDROID_PREFIX}"
    mv -vf "${pkgdir}/usr/local"/* "${pkgdir}/${ANDROID_PREFIX}"/
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
