# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Ilya Basin <basinilya at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksey Filippov <sarum9in at gmail dot com>
# Contributor: xantares <xantares09 at hotmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-gdbm
pkgver=1.23
pkgrel=1
arch=('any')
pkgdesc="GNU database library (Android ${_android_arch})"
url="http://www.gnu.org/software/gdbm/gdbm.html"
license=('GPL')
depends=("android-${_android_arch}-gettext"
         "android-${_android_arch}-libiconv")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
md5sums=('8551961e36bf8c70b7500d255d3658ec')

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
