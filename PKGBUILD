# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Orivej Desh <smpuj@bk.ru>

_android_arch=x86-64

pkgname=android-${_android_arch}-vamp-plugin-sdk
pkgver=2.10.0
pkgrel=1
arch=('any')
pkgdesc="The Vamp audio analysis plug-in system (Android ${_android_arch})"
url="https://www.vamp-plugins.org/"
license=('BSD')
depends=('android-ndk')
makedepends=("android-${_android_arch}-libsndfile")
optdepends=("android-${_android_arch}-libsndfile: for vamp-simple-host")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/vamp-plugins/vamp-plugin-sdk/archive/refs/tags/vamp-plugin-sdk-v${pkgver%.*}.tar.gz"
        '0001-Unversioned-libs.patch')
md5sums=('1e3277ade07411623e70bf977edfc954'
         '2245055b46d0113c5f6ddeb5cdf746b1')

prepare() {
    cd "${srcdir}/vamp-plugin-sdk-vamp-plugin-sdk-v${pkgver%.*}"

    patch -Np1 -i ../0001-Unversioned-libs.patch
}

build() {
    cd "${srcdir}/vamp-plugin-sdk-vamp-plugin-sdk-v${pkgver%.*}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
         --enable-programs=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/vamp-plugin-sdk-vamp-plugin-sdk-v${pkgver%.*}"
    source android-env ${_android_arch}

    export LDFLAGS="${LDFLAGS} -lsndfile"

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}/vamp"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
