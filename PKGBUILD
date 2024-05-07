# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-sdl2
pkgver=2.30.3
pkgrel=1
arch=('any')
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (Android ${_android_arch})"
url="https://www.libsdl.org"
license=('MIT')
depends=("android-${_android_arch}-libxext"
         "android-${_android_arch}-libxrender"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-libxcursor"
         "android-${_android_arch}-hidapi"
         "android-${_android_arch}-libusb")
makedepends=('android-cmake'
             "android-${_android_arch}-alsa-lib"
             "android-${_android_arch}-libxrandr"
             "android-${_android_arch}-libxinerama"
             "android-${_android_arch}-libxkbcommon"
             "android-${_android_arch}-libxss")
optdepends=("android-${_android_arch}-alsa-lib: ALSA audio driver")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz"{,.sig})
md5sums=('85ceed58290332fa4ef75a3dabfa1b89'
         'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

build() {
    cd "${srcdir}/SDL2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DSDL_HIDAPI_LIBUSB=ON \
        -DSDL_STATIC=ON \
        -DSDL_RPATH=OFF \
        -DSDL_ALSA=ON \
        -DALSA_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DALSA_LIBRARY="${ANDROID_PREFIX_LIB}/libalsa.so"
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/SDL2-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
