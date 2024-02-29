# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=aarch64

pkgname=android-${_android_arch}-unixodbc
pkgver=2.3.12
pkgrel=1
arch=('any')
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources (android)"
license=('GPL2' 'LGPL2.1')
url="http://www.unixodbc.org/"
depends=("android-${_android_arch}-readline"
         "android-${_android_arch}-libltdl")
options=(!strip !buildflags staticlibs !emptydirs)
source=("ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$pkgver.tar.gz")
sha256sums=('f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec')

build() {
    cd "${srcdir}/unixODBC-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/unixODBC-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_ETC}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
