# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-expat
pkgver=2.2.7
pkgrel=1
pkgdesc="An XML parser library (android)"
arch=('any')
url="http://expat.sourceforge.net"
license=("custom")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2")
sha256sums=('cbc9102f4a31a8dafd42d642e9a3aa31e79a0aedaa1f6efd2795ebc83174ec18')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/expat-${pkgver}

    android-${_android_arch}-configure --without-docbook
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/expat-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE} "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
