# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86-64

pkgname=android-${_android_arch}-pixman
pkgver=0.46.2
pkgrel=1
arch=('any')
pkgdesc="The pixel-manipulation library for X and cairo (Android ${_android_arch})"
url="http://xorg.freedesktop.org"
license=('custom')
groups=('android-pixman')
depends=('android-ndk')
makedepends=("android-meson"
             "android-${_android_arch}-libpng")
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.xz")
md5sums=('4c81133cc69a46a9436006756e43061f')

build() {
    cd "${srcdir}/pixman-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D loongson-mmi=disabled \
        -D vmx=disabled \
        -D arm-simd=disabled \
        -D neon=disabled \
        -D a64-neon=disabled \
        -D rvv=disabled \
        -D mips-dspr2=disabled \
        -D b_lto=false \
        -D gtk=disabled \
        -D strip=false \
        -D tests=disabled \
        -D demos=disabled
    ninja -C build
}

package() {
    cd "${srcdir}/pixman-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
