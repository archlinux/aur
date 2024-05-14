# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_android_arch=x86

pkgname=android-${_android_arch}-libsodium
pkgver=1.0.19
pkgrel=2
arch=('any')
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (Android ${_android_arch})"
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/jedisct1/libsodium/releases/download/1.0.19-RELEASE/libsodium-${pkgver}.tar.gz")
md5sums=('0d8e2233fc41be6d4c7ee36d5dfe9416')

build() {
    cd "${srcdir}/libsodium-stable"
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
    cd "${srcdir}/libsodium-stable"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g "$pkgdir/${ANDROID_PREFIX_LIB}"/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
