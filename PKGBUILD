# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>
# Contributor: Hervé YVIQUEL <elldekaa@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-hwloc
pkgver=2.10.0
pkgrel=4
arch=('any')
pkgdesc="Portable Hardware Locality is a portable abstraction of hierarchical architectures (Android, ${_android_arch})"
url='https://www.open-mpi.org/projects/hwloc/'
license=('BSD')
depends=("android-${_android_arch}-libtool"
         "android-${_android_arch}-libpciaccess")
makedepends=("android-${_android_arch}-cairo"
             "android-${_android_arch}-libxml2"
             "android-${_android_arch}-pciutils"
             "android-${_android_arch}-libx11"
             'android-configure')
optdepends=("android-${_android_arch}-cairo"
            "android-${_android_arch}-libxml2"
            "android-${_android_arch}-pciutils"
            "android-${_android_arch}-libx11")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/hwloc-${pkgver}.tar.bz2")
sha256sums=('0305dd60c9de2fbe6519fe2a4e8fdc6d3db8de574a0ca7812b92e80c05ae1392')

prepare() {
    cd "${srcdir}/hwloc-${pkgver}"

    # Remove all references to -lpthread

    sed -i 's|-lpthread||g' hwloc/Makefile.am
    sed -i 's|-lpthread||g' hwloc/Makefile.in
    sed -i 's|HWLOC_LIBS_PRIVATE -lpthread|HWLOC_LIBS_PRIVATE|g' configure
    sed -i 's|LIBS -lpthread|LIBS|g' configure
    sed -i 's|HWLOC_LIBS -lpthread|HWLOC_LIBS|g' configure
    sed -i 's|LIBS="-lpthread|LIBS="|g' configure
    sed -i 's|-lpthread||g' tests/hwloc/Makefile.am
    sed -i 's|-lpthread||g' tests/hwloc/Makefile.in
    sed -i 's|HWLOC_LIBS_PRIVATE -lpthread|HWLOC_LIBS_PRIVATE|g' config/hwloc.m4
    sed -i 's|LIBS -lpthread|LIBS|g' config/hwloc.m4
    sed -i 's|HWLOC_LIBS -lpthread|HWLOC_LIBS|g' config/hwloc.m4
}

build() {
    cd "${srcdir}/hwloc-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-plugins
    make -C "${PWD}/hwloc" $MAKEFLAGS
    make -C "${PWD}/include" $MAKEFLAGS
    make hwloc.pc $MAKEFLAGS
}

package() {
    cd "${srcdir}/hwloc-${pkgver}"
    source android-env ${_android_arch}

    make -C "${PWD}/hwloc" DESTDIR="${pkgdir}" install
    make -C "${PWD}/include" DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" install-hwlocpkgconfigDATA
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
