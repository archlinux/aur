# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libnl
pkgver=3.9.0
pkgrel=1
arch=('any')
pkgdesc='Library for applications dealing with netlink sockets (android)'
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/libnl-${pkgver}.tar.gz"{,.sig})
sha256sums=('aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb'
            'SKIP')
validpgpkeys=('49EA7C670E0850E7419514F629C2366E4DFC5728') # Thomas Haller

prepare() {
    cd "${srcdir}/libnl-$pkgver"

    sed -i 's|-lpthread||g' configure
}

build() {
    cd "${srcdir}/libnl-$pkgver"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -Din_addr_t=uint32_t"
    export CXXFLAGS="${CXXFLAGS} -Din_addr_t=uint32_t"

    android-${_android_arch}-configure \
        --enable-cli=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libnl-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
