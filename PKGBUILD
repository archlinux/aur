# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

_android_arch=x86

pkgname=android-${_android_arch}-libxslt
pkgver=1.1.43
pkgrel=1
arch=('any')
pkgdesc="XML stylesheet transformation library (Android ${_android_arch})"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
license=('custom:MIT')
groups=('android-libxslt')
depends=("android-${_android_arch}-libgcrypt"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-xz"
         'android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/libxslt/-/archive/v${pkgver}/libxslt-v${pkgver}.tar.gz"
        '0001-Allow-undefined.patch'
        '0002-Disable-programs-test-docs.patch')
md5sums=('cdb0024ed189f7e6e968e33a18444b3c'
         '44cd43c2b6e620197a78aa2973a23f0c'
         '054e65c82ccafb95e5fe7b148a153fec')

prepare() {
    cd "${srcdir}/libxslt-v${pkgver}"
    source android-env ${_android_arch}

    patch -p1 -i ../0001-Allow-undefined.patch
    patch -p1 -i ../0002-Disable-programs-test-docs.patch

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/libxslt-v${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --without-python
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libxslt-v${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
