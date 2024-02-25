# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86-64

pkgname=android-${_android_arch}-nettle
pkgver=3.9.1
pkgrel=1
pkgdesc="A low-level cryptographic library (android)"
arch=('any')
url="http://www.lysator.liu.se/~nisse/nettle"
license=("GPL2")
depends=("android-${_android_arch}-gmp")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/gnu/nettle/nettle-$pkgver.tar.gz")
sha256sums=('ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3')

build() {
    cd "$srcdir/nettle-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/nettle-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
