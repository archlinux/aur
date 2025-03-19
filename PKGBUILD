# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-srt
pkgver=1.5.4
pkgrel=1
arch=('any')
pkgdesc="Secure Reliable Transport library (Android ${_android_arch})"
url="https://www.srtalliance.org/"
license=('MPL2')
groups=('android-srt')
depends=("android-${_android_arch}-openssl")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/Haivision/srt/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('08e946bbcdb6f9dc3863de5dd8a48aa3')

prepare() {
    cd "${srcdir}/srt-${pkgver}"

    sed -i '/ERR_print_errors_fp/d' haicrypt/cryspr-openssl-evp.c
}

build() {
    cd "${srcdir}/srt-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DENABLE_STATIC=ON \
        -DENABLE_APPS=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}/srt-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
