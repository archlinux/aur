# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Christian Hesse <mail@eworm.de>

_android_arch=x86

pkgname=android-${_android_arch}-libxcrypt
pkgver=4.4.36
pkgrel=1
arch=('any')
pkgdesc='Modern library for one-way hashing of passwords (android)'
url='https://github.com/besser82/libxcrypt/'
license=('LGPL')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/download/v${pkgver}/libxcrypt-${pkgver}.tar.xz"{,.asc}
        '0001-Remove-OBSERVE_MEM.patch')
sha256sums=('e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943'
            'SKIP'
            'f11770eb92a33e12636a9b4b8acf4310c47865d23a8baa29d7baad5a179b4f09')
validpgpkeys=('678CE3FEE430311596DB8C16F52E98007594C21D') # Björn 'besser82' Esser

prepare() {
    cd "${srcdir}/libxcrypt-${pkgver}"

    # This patch seems to be very dangerous, but I have not any knowledgement
    # about assembly and did not found a better way of fixing the build.
    # Patches of the patch are welcome.
    patch -Np1 -i ../0001-Remove-OBSERVE_MEM.patch
}

build() {
    cd "${srcdir}/libxcrypt-${pkgver}"
    source android-env ${_android_arch}

    export LDFLAGS="${LDFLAGS} -Wl,-O1,--sort-common,--as-needed -Wl,--undefined-version"

    android-${_android_arch}-configure \
        --enable-hashes=strong,glibc \
        --enable-obsolete-api=no \
        --disable-failure-tokens
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libxcrypt-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
