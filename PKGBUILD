# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-srt
pkgver=1.5.3
pkgrel=1
arch=('any')
pkgdesc="Secure Reliable Transport library (Android ${_android_arch})"
url="https://www.srtalliance.org/"
license=('MPL2')
depends=("android-${_android_arch}-openssl")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/Haivision/srt/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('df8213a3669dd846ddaad0fa1e9f417b')

build() {
    cd "${srcdir}/srt-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DENABLE_STATIC=ON \
        -DENABLE_APPS=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}/srt-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
