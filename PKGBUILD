# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Markus Kitsinger (SwooshyCueb) <root at swooshalicio dot us>

_android_arch=aarch64

pkgname=android-${_android_arch}-libtool
pkgver=2.4.7
pkgrel=2
pkgdesc="A generic library support script (Android, ${_android_arch})"
arch=('any')
url="https://www.gnu.org/software/libtool"
license=('GPL')
depends=('android-ndk'
         'tar')
makedepends=('android-configure'
             'help2man')
provides=("android-${_android_arch}-libltdl=$pkgver")
conflicts=("android-${_android_arch}-libltdl")
replaces=("android-${_android_arch}-libltdl")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftpmirror.gnu.org/libtool/libtool-${pkgver}.tar.gz"
        "gnulib.tgz::https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=snapshot;h=HEAD;sf=tgz"
        "gnulib-bootstrap.zip::https://github.com/gnulib-modules/bootstrap/archive/refs/heads/master.zip")
sha256sums=('04e96c2404ea70c590c546eba4202a4e12722c640016c12b9b2f1ce3d481e9a8'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}"

    gnulibDir=$(ls -dt gnulib-HEAD-* | head -n 1)
    ln -sf "${srcdir}/${gnulibDir}" "${srcdir}/libtool-${pkgver}/gnulib"
    mkdir -p "${srcdir}/libtool-${pkgver}/gl-mod"
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

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
