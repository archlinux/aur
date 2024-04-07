# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.com>

_android_arch=x86

pkgname=android-${_android_arch}-xxhash
pkgver=0.8.2
pkgrel=1
arch=('any')
pkgdesc="Extremely fast non-cryptographic hash algorithm (Android ${_android_arch})"
url="https://cyan4973.github.io/xxHash/"
license=('GPL2'
         'BSD')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/Cyan4973/xxHash/archive/refs/tags/v${pkgver}.tar.gz"
        '0001-Use-unversioned-libs.patch')
md5sums=('a7628d7a4fd608a7573c5a3e2c856ea5'
         '80d3622c1743b06847d3e552b8aa25e0')

prepare() {
    cd "${srcdir}/xxHash-$pkgver"

    patch -Np1 -i ../0001-Use-unversioned-libs.patch
}

build() {
    cd "${srcdir}/xxHash-$pkgver"
    source android-env ${_android_arch}

    make PREFIX="${ANDROID_PREFIX}" $MAKEFLAGS lib
}

package() {
    cd "${srcdir}/xxHash-$pkgver"
    source android-env ${_android_arch}

    make PREFIX="${ANDROID_PREFIX}" DESTDIR="${pkgdir}" \
        install_libxxhash.a \
        install_libxxhash \
        install_libxxhash.includes \
        install_libxxhash.pc
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
