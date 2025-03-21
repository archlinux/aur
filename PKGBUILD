# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-libksba
pkgver=1.6.7
pkgrel=2
arch=('any')
pkgdesc="A CMS and X.509 access library (Android ${_android_arch})"
url="https://www.gnupg.org/related_software/libksba/index.html"
license=('GPL')
groups=('android-libksba')
depends=("android-${_android_arch}-libgpg-error")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gnupg.org/ftp/gcrypt/libksba/libksba-${pkgver}.tar.bz2")
md5sums=('7e736de467b67c7ea88de746c31ea12f')

build() {
    cd "${srcdir}/libksba-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --with-libgpg-error-prefix="${ANDROID_PREFIX}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libksba-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
