# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Markus Kitsinger (SwooshyCueb) <root at swooshalicio dot us>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libtool
pkgver=2.5.4
pkgrel=1
pkgdesc="A generic library support script (Android ${_android_arch})"
arch=('any')
url="https://www.gnu.org/software/libtool"
license=('GPL')
groups=('android-libtool')
depends=('android-ndk'
         'tar')
makedepends=('android-configure'
             'help2man')
provides=("android-${_android_arch}-libltdl=${pkgver}")
conflicts=("android-${_android_arch}-libltdl")
replaces=("android-${_android_arch}-libltdl")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftpmirror.gnu.org/libtool/libtool-${pkgver}.tar.xz"
        "gnulib.tar.gz::https://github.com/coreutils/gnulib/archive/refs/heads/master.tar.gz"
        "gnulib-bootstrap.tar.gz::https://github.com/gnulib-modules/bootstrap/archive/refs/heads/master.tar.gz")
md5sums=('22e0a29df8af5fdde276ea3a7d351d30'
         'SKIP'
         'SKIP')

prepare() {
    cd "${srcdir}"

    rm -rvf "${srcdir}/libtool-${pkgver}/gnulib"
    ln -sf "${srcdir}/gnulib-master" "${srcdir}/libtool-${pkgver}/gnulib"
    mkdir -p "${srcdir}/libtool-${pkgver}/gl-mod"
    rm -rvf "${srcdir}/libtool-${pkgver}/gl-mod/bootstrap"
    ln -sf "${srcdir}/bootstrap-master" "${srcdir}/libtool-${pkgver}/gl-mod/bootstrap"

    cd "${srcdir}/libtool-${pkgver}"
    source android-env ${_android_arch}

    ./bootstrap --force \
        --gnulib-srcdir "${srcdir}/libtool-${pkgver}/gnulib"
}

build() {
    cd "${srcdir}/libtool-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --infodir="${ANDROID_PREFIX_SHARE}/info/libtool" \
        lt_cv_sys_lib_dlsearch_path_spec="${ANDROID_PREFIX_LIB}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libtool-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
