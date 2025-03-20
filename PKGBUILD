# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-npth
pkgver=1.8
pkgrel=1
arch=('any')
pkgdesc="The new GNU portable threads library (Android ${_android_arch})"
url="https://www.gnupg.org/software/npth/index.html"
license=('LGPL-2.1-or-later')
groups=('android-npth')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gnupg.org/ftp/gcrypt/npth/npth-${pkgver}.tar.bz2")
md5sums=('cb4fc0402be5ba67544e499cb2c1a74d')

prepare() {
    cd "${srcdir}/npth-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
    sed  -i 's|have_ld_version_script=yes|have_ld_version_script=no|g' configure
    sed  -i '/config_libs \$LIB_CLOCK_GETTIME/d' configure
    sed  -i 's|@NPTH_CONFIG_LIBS@|-lnpth|g' npth.pc.in
    sed  -i 's|@INSERT_EXPOSE_RWLOCK_API@|1|g' src/npth.h.in
}

build() {
    cd "${srcdir}/npth-${pkgver}"
    source android-env ${_android_arch}

    export ac_cv_search_pthread_cancel=yes
    export ac_cv_type_pthread_rwlock_t=yes
    export ac_cv_search_clock_gettime=yes
    android-${_android_arch}-configure \
        --disable-tests
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/npth-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
