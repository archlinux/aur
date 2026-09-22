# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=riscv64

pkgname=android-${_android_arch}-zlib
pkgver=1.3.2
pkgrel=1
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
md5sums=('be8a129ec5d60c5084911fd7ea16d84e'
         'ebb25b85a3a53c1fbc03df4a7a6791bb'
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
