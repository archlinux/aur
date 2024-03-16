# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-zlib
pkgver=1.3.1
pkgrel=2
arch=('any')
pkgdesc="A compression/decompression Library (Android, ${_android_arch})"
url="http://www.zlib.net/"
license=('custom:zlib')
depends=('android-ndk')
makedepends=('android-environment'
             'android-pkg-config'
             'android-sdk-build-tools')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/madler/zlib/releases/download/v$pkgver/zlib-$pkgver.tar.xz"
        "0001-Disable-versioning.patch"
        "0002-Fix-CC-definition.patch"
        "0003-Fix-missing-symbols.patch")
md5sums=('5e6af153311327e516690d300527ec9e'
         'c2d3fe1aba79ec3e75758b2f6478c980'
         '9426b0365165dfa868c905825c48ef8e'
         '947d7215f8cfa3c579b4ba47bcd0a6d5')

prepare() {
    cd "${srcdir}"/zlib-${pkgver}

    patch -Np1 -i ../0001-Disable-versioning.patch
    patch -Np1 -i ../0002-Fix-CC-definition.patch
    patch -Np1 -i ../0003-Fix-missing-symbols.patch
}

build() {
    cd "${srcdir}"/zlib-${pkgver}
    source android-env ${_android_arch}

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
