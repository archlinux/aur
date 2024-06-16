# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_android_arch=x86

pkgname=android-${_android_arch}-alsa-lib
pkgver=1.2.12
pkgrel=1
arch=('any')
pkgdesc="An alternative implementation of Linux sound support (Android ${_android_arch})"
url="https://www.alsa-project.org"
license=('LGPL-2.1-or-later')
depends=("android-${_android_arch}-alsa-topology-conf"
         "android-${_android_arch}-alsa-ucm-conf")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("$url/files/pub/lib/alsa-lib-$pkgver.tar.bz2"{,.sig})
md5sums=('97bbf3cca911c1701fe9fe115c32b03d'
         'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
    cd "${srcdir}/alsa-lib-$pkgver"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/alsa-lib-$pkgver"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        export ac_cv_header_sys_shm_h=no
    fi

    target=${_android_arch/x86-/x86_}-linux-android

    ./configure \
        --host="${target}" \
        --target="${target}" \
        --build="${CHOST}" \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --enable-shared \
        --without-debug \
        --without-versioned
    # prevent excessive overlinking due to libtool
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/alsa-lib-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
