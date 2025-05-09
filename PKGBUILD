# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-alsa-lib
pkgver=1.2.14
pkgrel=1
arch=('any')
pkgdesc="An alternative implementation of Linux sound support (Android ${_android_arch})"
url="https://www.alsa-project.org"
license=('LGPL-2.1-or-later')
groups=(android-alsa-lib)
depends=("android-${_android_arch}-alsa-topology-conf"
         "android-${_android_arch}-alsa-ucm-conf")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/files/pub/lib/alsa-lib-${pkgver}.tar.bz2"{,.sig})
md5sums=('d0efd7930da31f0034baddc0b993fa03'
         'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
    cd "${srcdir}/alsa-lib-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/alsa-lib-${pkgver}"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        export ac_cv_header_sys_shm_h=no
    fi

    target=${_android_arch/x86-/x86_}-linux-android

    mkdir -p build-shared && pushd build-shared
    ../configure \
        --host="${target}" \
        --target="${target}" \
        --build="${CHOST}" \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --enable-shared=yes \
        --enable-static=no \
        --without-debug \
        --without-versioned
    popd

    # prevent excessive overlinking due to libtool
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' build-shared/libtool
    make -C build-shared $MAKEFLAGS

    mkdir -p build-static && pushd build-static
    ../configure \
        --host="${target}" \
        --target="${target}" \
        --build="${CHOST}" \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --enable-shared=no \
        --enable-static=yes \
        --without-debug \
        --without-versioned
    popd

    # prevent excessive overlinking due to libtool
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' build-static/libtool
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/alsa-lib-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
