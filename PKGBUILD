# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=riscv64

pkgname=android-${_android_arch}-nettle
pkgver=3.10.2
pkgrel=1
pkgdesc="A low-level cryptographic library (Android ${_android_arch})"
arch=('any')
url="http://www.lysator.liu.se/~nisse/nettle"
license=("GPL2")
groups=('android-nettle')
depends=("android-${_android_arch}-gmp")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/gnu/nettle/nettle-${pkgver}.tar.gz"
        '0001-Unversioned-libs.patch')
md5sums=('b28bcbf6f045ff007940a9401673600d'
         '604ae2c58164024fbe4debc2aa6eb6cc')

prepare() {
    cd "${srcdir}/nettle-${pkgver}"

    patch -Np1 -i ../0001-Unversioned-libs.patch
}

build() {
    cd "${srcdir}/nettle-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-ld-version-script=no \
        --disable-documentation
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/nettle-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
