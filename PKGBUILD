# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-webrtc-audio-processing-1
pkgver=1.3
pkgrel=1
arch=('any')
pkgdesc="AudioProcessing library based on Google's implementation of WebRTC (Android ${_android_arch})"
url="https://freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
license=('custom')
depends=("android-${_android_arch}-abseil-cpp")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/archive/v${pkgver}/webrtc-audio-processing-v${pkgver}.tar.bz2")
md5sums=('165b07e52ffdfe8c5b92a90f2ccc8691')

build() {
    cd "${srcdir}/webrtc-audio-processing-v${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        -D cpp_std=c++17
    meson compile
}

package() {
    cd "${srcdir}/webrtc-audio-processing-v${pkgver}"
    source android-env ${_android_arch}

    meson install -C build --destdir "$pkgdir"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
