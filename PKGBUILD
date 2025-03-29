# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libsoup3
pkgver=3.6.5
pkgrel=1
arch=('any')
pkgdesc="HTTP client/server library for GNOME (Android ${_android_arch})"
url="https://wiki.gnome.org/Projects/libsoup"
license=('LGPL')
groups=('android-libsoup3')
depends=("android-${_android_arch}-brotli"
         "android-${_android_arch}-libnghttp2"
         "android-${_android_arch}-libpsl"
         "android-${_android_arch}-sqlite")
makedepends=('android-meson'
             'gobject-introspection')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/libsoup/-/archive/${pkgver}/libsoup-${pkgver}.tar.bz2")
md5sums=('343595b48c2227b9ecd557b6c46bbb6d')

build() {
    cd "${srcdir}/libsoup-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Dautobahn=disabled \
        -Dvapi=disabled \
        -Ddocs=disabled \
        -Ddoc_tests=false \
        -Dtests=false \
        -Dsysprof=disabled \
        -Dpkcs11_tests=disabled \
        -Dtls_check=false \
        -Dintrospection=disabled
    ninja -C build
}

package() {
    cd "${srcdir}/libsoup-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" meson install -C build
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
