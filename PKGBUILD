# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-gdk-pixbuf2
pkgver=2.42.12
pkgrel=2
arch=('any')
pkgdesc="An image loading library (Android ${_android_arch})"
url="https://wiki.gnome.org/Projects/GdkPixbuf"
license=('LGPL')
groups=(android-gdk-pixbuf2)
depends=("android-${_android_arch}-glib2"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libtiff"
         "android-${_android_arch}-libjpeg")
makedepends=('android-meson'
             'gobject-introspection')
optdepends=(
  "android-${_android_arch}-libwmf: Load .wmf and .apm"
  "android-${_android_arch}-libavif: Load .avif"
  "android-${_android_arch}-libheif: Load .heif, .heic, and .avif"
  "android-${_android_arch}-libjxl: Load .jxl"
  "android-${_android_arch}-librsvg: Load .svg, .svgz, and .svg.gz"
  "android-${_android_arch}-webp-pixbuf-loader: Load .webp"
)
conflicts=("android-${_android_arch}-gdk-pixbuf2-bootstrap")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/archive/${pkgver}/gdk-pixbuf-${pkgver}.tar.bz2")
md5sums=('8d6e95d829ade125d9cece4ad1cc6dff')

build() {
    cd "${srcdir}/gdk-pixbuf-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Dbuiltin_loaders=all \
        -Dinstalled_tests=false \
        -Dman=false \
        -Dtests=false
    ninja -C build
}

package() {
    cd "${srcdir}/gdk-pixbuf-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install -C build
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
