# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-liburing
pkgver=2.9
pkgrel=1
arch=('any')
pkgdesc="Linux-native io_uring I/O access library (Android ${_android_arch})"
url='https://git.kernel.dk/cgit/liburing'
license=('(GPL-2.0-only WITH Linux-syscall-note) OR MIT'
         'LGPL-2.0-or-later'
         'MIT')
groups=('android-liburing')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/axboe/liburing/archive/refs/tags/liburing-${pkgver}.tar.gz"
        '0001-Fix-libs-install.patch')
md5sums=('50cbca5567878abaeb6824909b647422'
         '8134d4faf929451e20da833737788284')

prepare() {
    cd "${srcdir}/liburing-liburing-${pkgver}"

    patch -Np1 -i ../0001-Fix-libs-install.patch
    sed -i 's|\$(QUIET_CC)||g' src/Makefile
}

build() {
    cd "${srcdir}/liburing-liburing-${pkgver}"
    source android-env ${_android_arch}

    export CPPFLAGS="-D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"
    export LDFLAGS="${LDFLAGS} -Wl,--undefined-version"

    ./configure \
        --prefix="${ANDROID_PREFIX}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --libdevdir="${ANDROID_PREFIX_LIB}" \
        --mandir="${ANDROID_PREFIX_SHARE}/man" \
        --datadir="${ANDROID_PREFIX_SHARE}" \
        --cc="${ANDROID_CC}" \
        --cxx="${ANDROID_CXX}" \
        --use-libc
    make -C "${PWD}/src" $MAKEFLAGS
}

package() {
    cd "${srcdir}/liburing-liburing-${pkgver}"
    source android-env ${_android_arch}

    make -C "${PWD}/src" DESTDIR="${pkgdir}" ENABLE_SHARED=1 install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    for pc in liburing.pc liburing-ffi.pc; do
        pcFile=${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/${pc}
        install -D -m 644 "${srcdir}/liburing-liburing-${pkgver}/${pc}.in" "${pcFile}"
        sed -i -e "s%@prefix@%${ANDROID_PREFIX}%g" \
               -e "s%@libdir@%${ANDROID_PREFIX_LIB}%g" \
               -e "s%@includedir@%${ANDROID_PREFIX_INCLUDE}%g" \
               -e "s%@NAME@%liburing%g" \
               -e "s%@VERSION@%${pkgver}%g" \
               "${pcFile}"
    done
}
