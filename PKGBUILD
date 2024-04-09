# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-gdk-pixbuf2-bootstrap
pkgver=2.42.10
pkgrel=1
arch=('any')
pkgdesc="An image loading library (Android ${_android_arch})"
url="https://wiki.gnome.org/Projects/GdkPixbuf"
license=('LGPL')
groups=('android-gdk-pixbuf2-bootstrap')
depends=("android-${_android_arch}-glib2"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libtiff"
         "android-${_android_arch}-libjpeg")
makedepends=('android-meson'
             'gobject-introspection')
provides=("android-${_android_arch}-gdk-pixbuf2")
conflicts=("android-${_android_arch}-gdk-pixbuf2")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/archive/${pkgver}/gdk-pixbuf-${pkgver}.tar.bz2")
md5sums=('2861bcef6effa7bbd608a965479ce34b')

build() {
    cd "${srcdir}/gdk-pixbuf-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        -D builtin_loaders=all \
        -D installed_tests=false \
        -D man=false \
        -D tests=false
    ninja
}

package() {
    cd "${srcdir}/gdk-pixbuf-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
