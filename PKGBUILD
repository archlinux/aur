# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-l-smash
pkgver=2.14.5
pkgrel=2
arch=('any')
license=('custom')
url='https://github.com/l-smash/l-smash'
pkgdesc="MP4 muxer and other tools (Android ${_android_arch})"
groups=('android-l-smash')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/l-smash/l-smash/archive/v${pkgver}.tar.gz"
        "clang.patch")
md5sums=('5915de411970abafbad8003599196fee'
         'SKIP')

prepare() {
    cd "${srcdir}/l-smash-${pkgver}"
    patch -Np1 -i ../clang.patch

    sed -i 's|-Wl,--version-script,liblsmash\.ver||g' configure

    if [[ "${_android_arch}" == armv7a-eabi || "${_android_arch}" == x86 ]]; then
        sed -i 's|ftello|ftell|g' common/osdep.h
        sed -i 's|fseeko|fseek|g' common/osdep.h
    fi
}

build() {
    cd "${srcdir}/l-smash-${pkgver}"
    source android-env ${_android_arch}

    ./configure \
        --prefix=${ANDROID_PREFIX} \
        --cc=${ANDROID_CC} \
        --cross-prefix=${ANDROID_TOOLS_PREFIX} \
        --enable-shared \
        --extra-cflags="$CFLAGS" \
        --extra-ldflags="$LDFLAGS"
    make STRIP="" $MAKEFLAGS
}

package() {
    cd "${srcdir}/l-smash-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" STRIP="" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
