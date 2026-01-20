# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Christian Hesse <mail@eworm.de>

_android_arch=x86-64

pkgname=android-${_android_arch}-libxcrypt
pkgver=4.5.2
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
md5sums=('25e888919ddcd153a07daa95224fa436'
         'SKIP'
         '23f565873455e10371dcea9c40a2a37c')
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

    install -vDm 644 COPYING.LIB -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
