# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libnl
pkgver=3.12.0
pkgrel=1
arch=('any')
pkgdesc="Library for applications dealing with netlink sockets (Android ${_android_arch})"
url='https://github.com/thom311/libnl/'
license=('GPL')
groups=('android-libnl')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/libnl-${pkgver}.tar.gz")
md5sums=('f9112ca215807fe65eecd583d8f180cc')

prepare() {
    cd "${srcdir}/libnl-${pkgver}"

    sed -i 's|-lpthread||g' configure
}

build() {
    cd "${srcdir}/libnl-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -Din_addr_t=uint32_t"
    export CXXFLAGS="${CXXFLAGS} -Din_addr_t=uint32_t"

    android-${_android_arch}-configure \
        --enable-cli=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libnl-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
