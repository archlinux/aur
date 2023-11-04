# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-zlib
pkgver=1.3
pkgrel=1
pkgdesc="A compression/decompression Library (android)"
arch=('any')
url="http://www.zlib.net/"
license=('custom:zlib')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config' 'android-sdk-build-tools')
source=("http://zlib.net/zlib-${pkgver}.tar.gz"
        "0001-Disable-versioning.patch"
        "0002-Fix-CC-definition.patch")
md5sums=('60373b133d630f74f4a1f94c1185a53f'
         'c2d3fe1aba79ec3e75758b2f6478c980'
         '2420be2579d725c1cf1e0aac7ae0a4fe')

prepare() {
    cd "${srcdir}"/zlib-${pkgver}
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Disable-versioning.patch
    patch -Np1 -i ../0002-Fix-CC-definition.patch
}

build() {
    cd "${srcdir}"/zlib-${pkgver}
    source android-env ${_android_arch}

    export CC=${ANDROID_CC}
    export CXX=${ANDROID_CXX}

    # Platform specific patches
    case "$_android_arch" in
        x86-64)
            export CFLAGS="$CFLAGS -fPIC"
            ;;
        *)
            ;;
    esac

    ./configure \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --includedir=${ANDROID_PREFIX_INCLUDE} \
        --enable-shared

    make $MAKEFLAGS
}

package () {
    cd "${srcdir}"/zlib-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so || true
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
