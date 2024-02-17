# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Chris Kitching <chriskitching@linux.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_android_arch=aarch64

pkgname=android-${_android_arch}-cairo-bootstrap
pkgver=1.18.0
pkgrel=3
arch=('any')
pkgdesc="2D graphics library with support for multiple output devices (android bootstrap)"
depends=("android-${_android_arch}-fontconfig"
         "android-${_android_arch}-glib2"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-lzo"
         "android-${_android_arch}-pixman"
         "android-${_android_arch}-zlib")
provides=("android-${_android_arch}-cairo")
conflicts=("android-${_android_arch}-cairo")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
license=("LGPL" "MPL")
url="http://cairographics.org/"
source=("https://gitlab.freedesktop.org/cairo/cairo/-/archive/${pkgver}/cairo-${pkgver}.tar.gz"
        "0001-Added-missing-headers-and-symbols.patch"
        "0002-ipc-rmid-deferred-release.patch"
        "0026-create-argb-fonts.all.patch")
sha256sums=('39a78afdc33a435c0f2ab53a5ec2a693c3c9b6d2ec9783ceecb2b94d54d942b0'
            'a73c90af559d4fb2e72bdd80ebc624b19579f3df0e9c0ad6e8af9aef41e7789a'
            '50143b4a090169b1d086cffdf1f0364c82facc886466e3b2f7fea668520961e8'
            '6db6c44fbdb4926d09afa978fe80430186c4b7b7d255059602b1f94c6a079975')

prepare() {
    cd "${srcdir}/cairo-${pkgver}"
    patch -Np1 -i ../0001-Added-missing-headers-and-symbols.patch
    patch -Np1 -i ../0002-ipc-rmid-deferred-release.patch
    patch -Np1 -i ../0026-create-argb-fonts.all.patch
}

build() {
    cd "${srcdir}/cairo-${pkgver}"
    source android-env ${_android_arch}

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
        -D xcb=disabled \
        -D xlib=disabled \
        -D xlib-xcb=disabled \
        --buildtype=release \
        --default-library=both
    ninja
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/cairo-${pkgver}/build" install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
