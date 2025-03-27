# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Chris Kitching <chriskitching@linux.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_android_arch=x86

pkgname=android-${_android_arch}-cairo
pkgver=1.18.4
pkgrel=1
arch=('any')
pkgdesc="2D graphics library with support for multiple output devices (Android ${_android_arch})"
license=('LGPL'
         'MPL')
url="http://cairographics.org/"
groups=('android-cairo')
depends=("android-${_android_arch}-fontconfig"
         "android-${_android_arch}-glib2"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-lzo"
         "android-${_android_arch}-pixman"
         "android-${_android_arch}-zlib")
provides=("android-${_android_arch}-cairo")
conflicts=("android-${_android_arch}-cairo")
makedepends=('android-meson'
             "android-${_android_arch}-poppler")

# riscv64 target is not properly supported by rust so disable the librsvg
# dependency in that architecture for now
if [ "${_android_arch}" != riscv64 ]; then
    makedepends+=("android-${_android_arch}-librsvg")
fi

options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.freedesktop.org/cairo/cairo/-/archive/${pkgver}/cairo-${pkgver}.tar.gz"
        "0001-Added-missing-headers-and-symbols.patch"
        "0002-ipc-rmid-deferred-release.patch"
        "0026-create-argb-fonts.all.patch")
md5sums=('4abef192526f92774f8edcb88d47be95'
         'f56d559a886e4f6cf2c0aa567a0b8645'
         'ee5b94e1591fe0e1b8cc035f9a699b16'
         'b4d8fac687dd2b01879ca62452c15732')

prepare() {
    cd "${srcdir}/cairo-${pkgver}"

    patch -Np1 -i ../0001-Added-missing-headers-and-symbols.patch
    patch -Np1 -i ../0002-ipc-rmid-deferred-release.patch
    patch -Np1 -i ../0026-create-argb-fonts.all.patch
}

build() {
    cd "${srcdir}/cairo-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D spectre=disabled \
        -D dwrite=disabled \
        -D freetype=enabled \
        -D fontconfig=enabled \
        -D tests=disabled \
        -D symbol-lookup=disabled \
        -D gtk_doc=false \
        -D xcb=disabled \
        -D xlib=disabled \
        -D xlib-xcb=disabled
    echo '#define HAVE_CTIME_R 1'$'\n' >> build/config.h
    ninja -C build
}

package() {
    cd "${srcdir}/cairo-${pkgver}"

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
