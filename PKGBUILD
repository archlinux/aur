# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_android_arch=x86

pkgname=android-${_android_arch}-libsodium
pkgver=1.0.20
pkgrel=2
arch=('any')
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (Android ${_android_arch})"
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
groups=('android-libsodium')
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
        riscv64)
            export CFLAGS="${CFLAGS// -O2/}"
            export CPPFLAGS="${CPPFLAGS// -O2/}"
            export CXXFLAGS="${CXXFLAGS// -O2/}"
            ;;
        *)
            ;;
    esac

    target=${_android_arch/x86-/x86_}-linux-android

    ./configure \
        --host=${target} \
        --target=${target} \
        --build=${CHOST} \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --includedir=${ANDROID_PREFIX_INCLUDE} \
        --enable-shared \
        --enable-static
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libsodium-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
