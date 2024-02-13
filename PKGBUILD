# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-pixman
pkgver=0.42.2
pkgrel=3
pkgdesc="The pixel-manipulation library for X and cairo (android)"
arch=('any')
url="http://xorg.freedesktop.org"
license=("custom")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=("android-meson"
             "android-${_android_arch}-libpng")
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.xz")
sha512sums=('3476e2676e66756b1af61b1e532cd80c985c191fb7956eb01702b419726cce99e79163b7f287f74f66414680e7396d13c3fee525cd663f12b6ac4877070ff4e8')

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
