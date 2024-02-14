# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-pixman
pkgver=0.43.2
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo (android)"
arch=('any')
url="http://xorg.freedesktop.org"
license=("custom")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=("android-meson"
             "android-${_android_arch}-libpng")
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.xz")
sha512sums=('1a1d21b86b3c6784c4c2606b7069723b4dbb747eac9fce95bca86516787840379ffd49abc42d11e7143e85c32c85496f33c2562c7a910ca6f963599affdc3224')

build() {
    cd "${srcdir}/pixman-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D loongson-mmi=disabled \
        -D vmx=disabled \
        -D arm-simd=disabled \
        -D neon=disabled \
        -D a64-neon=disabled \
        -D iwmmxt=disabled \
        -D mips-dspr2=disabled \
        -D b_lto=false \
        -D gtk=disabled \
        -D strip=false \
        --default-library both
    ninja -C build
}

package() {
    cd "${srcdir}/pixman-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
