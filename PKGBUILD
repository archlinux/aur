# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Chris Kitching <chriskitching@linux.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-cairo-bootstrap
pkgver=1.18.0
pkgrel=1
arch=('any')
pkgdesc="2D graphics library with support for multiple output devices (android bootstrap)"
depends=("android-${_android_arch}-pixman"
         "android-${_android_arch}-glib2"
         "android-${_android_arch}-fontconfig"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-lzo")
provides=("android-${_android_arch}-cairo")
conflicts=("android-${_android_arch}-cairo")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
license=("LGPL" "MPL")
url="http://cairographics.org/"
source=("https://gitlab.freedesktop.org/cairo/cairo/-/archive/${pkgver}/cairo-${pkgver}.tar.gz"
        "0001-Added-missing-headers-and-symbols.patch"
        "0026-create-argb-fonts.all.patch")
sha256sums=('39a78afdc33a435c0f2ab53a5ec2a693c3c9b6d2ec9783ceecb2b94d54d942b0'
            'a73c90af559d4fb2e72bdd80ebc624b19579f3df0e9c0ad6e8af9aef41e7789a'
            '6db6c44fbdb4926d09afa978fe80430186c4b7b7d255059602b1f94c6a079975')

prepare() {
    cd "${srcdir}/cairo-${pkgver}"
    patch -Np1 -i ../0001-Added-missing-headers-and-symbols.patch
    patch -Np1 -i ../0026-create-argb-fonts.all.patch
}

build() {
    cd "${srcdir}/cairo-${pkgver}"
    source android-env ${_android_arch}

    export C_INCLUDE_PATH="${ANDROID_PREFIX_INCLUDE}/freetype2:${ANDROID_PREFIX_INCLUDE}/pixman-1:${ANDROID_PREFIX_INCLUDE}/libpng:${ANDROID_PREFIX_INCLUDE}/glib-2.0:${ANDROID_PREFIX_LIB}/glib-2.0/include:${ANDROID_PREFIX_INCLUDE}"

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        -D spectre=disabled \
        -D dwrite=disabled \
        -D freetype=enabled \
        -D fontconfig=enabled \
        -D tests=disabled \
        -D symbol-lookup=disabled \
        -D gtk_doc=false \
        --buildtype=release \
        --default-library=both
    ninja
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/cairo-${pkgver}/build" install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
