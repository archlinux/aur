# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Ilya Basin <basinilya at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksey Filippov <sarum9in at gmail dot com>
# Contributor: xantares <xantares09 at hotmail dot com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-gdbm
pkgver=1.19
pkgrel=1
arch=('any')
pkgdesc="GNU database library (android)"
url="http://www.gnu.org/software/gdbm/gdbm.html"
license=('GPL')
depends=("android-${_android_arch}-gettext"
         "android-${_android_arch}-libiconv")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
sha256sums=('37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc')

prepare() {
    cd "${srcdir}/gdbm-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -vfi
}

build() {
    cd "${srcdir}/gdbm-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-libgdbm-compat
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/gdbm-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a

    # create symlinks for compatibility
    install -dm755 "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/gdbm"
    ln -sf ../gdbm.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/gdbm/gdbm.h"
}
