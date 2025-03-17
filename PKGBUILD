# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Christian Hesse <mail@eworm.de>

_android_arch=riscv64

pkgname=android-${_android_arch}-libxcrypt
pkgver=4.4.38
pkgrel=1
arch=('any')
pkgdesc="Modern library for one-way hashing of passwords (Android ${_android_arch})"
url='https://github.com/besser82/libxcrypt/'
license=('LGPL')
groups=('android-libxcrypt')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/download/v${pkgver}/libxcrypt-${pkgver}.tar.xz"{,.asc}
        '0001-Remove-OBSERVE_MEM.patch')
md5sums=('1796a5d20098e9dd9e3f576803c83000'
         'SKIP'
         '207f77073cf8152f2eac5c0b63ace245')
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
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
