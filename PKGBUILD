# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libsodium
pkgver=1.0.20
pkgrel=1
arch=('any')
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (Android ${_android_arch})"
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/jedisct1/libsodium/releases/download/${pkgver}-RELEASE/libsodium-${pkgver}.tar.gz")
md5sums=('597f2c7811f84e63e45e2277dfb5da46')

build() {
    cd "${srcdir}/libsodium-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "${_android_arch}" in
        aarch64)
            export CFLAGS="${CFLAGS} -march=armv8-a+crypto"
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libsodium-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
