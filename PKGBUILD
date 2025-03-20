# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Bob Finch <w9ya@qrparci.net>

_android_arch=x86-64

pkgname=android-${_android_arch}-portaudio
pkgver=19.7.0
pkgrel=3
arch=('any')
pkgdesc="A free, cross-platform, open source, audio I/O library. (Android ${_android_arch})"
url="https://github.com/portaudio/portaudio/"
license=('MIT')
groups=('android-portaudio')
depends=('android-ndk')
makedepends=('android-cmake'
             "android-${_android_arch}-alsa-lib")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/archive/v${pkgver}/portaudio-v${pkgver}.tar.gz")
md5sums=('49ecd6de2350b3a1466116538f7be0e7')

prepare() {
    cd "${srcdir}/portaudio-${pkgver}"
    source android-env ${_android_arch}

    (
        cd bindings/cpp
        autoreconf -fiv
    )

    autoreconf -fiv

    sed -i 's|"-lpthread |"|g' configure
    sed -i 's| -lpthread"|"|g' configure
    sed -i 's| -lpthread"|"|g' bindings/cpp/build/gnu/configure
    sed -i 's| -lpthread"|"|g' CMakeLists.txt
}

build() {
    cd "${srcdir}/portaudio-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-cxx

    # build breaks with multiple jobs when building C++ bindings:
    # https://github.com/PortAudio/portaudio/issues/540
    make -j1
}

package() {
    cd "${srcdir}/portaudio-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
