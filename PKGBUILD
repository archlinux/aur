# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>
# Contributor: Hervé YVIQUEL <elldekaa@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-hwloc
pkgver=2.10.0
pkgrel=1
arch=('any')
pkgdesc='Portable Hardware Locality is a portable abstraction of hierarchical architectures (android)'
url='https://www.open-mpi.org/projects/hwloc/'
license=('BSD')
depends=("android-${_android_arch}-libtool"
         "android-${_android_arch}-libpciaccess")
makedepends=("android-${_android_arch}-cairo"
             "android-${_android_arch}-libxml2"
             "android-${_android_arch}-pciutils"
             "android-${_android_arch}-libx11")
optdepends=("android-${_android_arch}-cairo"
            "android-${_android_arch}-libxml2"
            "android-${_android_arch}-pciutils"
            "android-${_android_arch}-libx11")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/hwloc-${pkgver}.tar.bz2")
sha256sums=('0305dd60c9de2fbe6519fe2a4e8fdc6d3db8de574a0ca7812b92e80c05ae1392')

build() {
    cd "${srcdir}/hwloc-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-plugins
    make -C "${PWD}/hwloc" $MAKEFLAGS
    make hwloc.pc $MAKEFLAGS
}

package() {
    cd "${srcdir}/hwloc-${pkgver}"
    source android-env ${_android_arch}

    make -C "${PWD}/hwloc" DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" install-hwlocpkgconfigDATA
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
