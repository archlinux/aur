# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_android_arch=x86

pkgname=android-${_android_arch}-libsodium
pkgver=1.0.19
pkgrel=1
arch=('any')
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (android)"
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.libsodium.org/libsodium/releases/libsodium-$pkgver.tar.gz")
sha512sums=('8e9b6d796f6330e00921ce37f1b43545966094250938626ae227deef5fd1279f2fc18b5cd55e23484732a27df4d919cf0d2f07b9c2f1aa0c0ef689e668b0d439')

build() {
    cd "${srcdir}/libsodium-stable"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
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
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
