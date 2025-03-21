# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: 03/08/04 <lefungus@altern.org>

_android_arch=x86

pkgname=android-${_android_arch}-libebml
pkgver=1.4.5
pkgrel=3
arch=('any')
pkgdesc="Extensible Binary Meta Language library (Android ${_android_arch})"
url='https://github.com/Matroska-Org/libebml'
license=('LGPL2.1')
groups=('android-libebml')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/Matroska-Org/libebml/archive/refs/tags/release-${pkgver}.tar.gz")
md5sums=('2fb834d776f20b4c05fe80e2be219fa0')

build() {
    cd "${srcdir}/libebml-release-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
    make -C build-shared

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=OFF \
        -Wno-dev
    make -C build-static
}

package() {
    cd "${srcdir}/libebml-release-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
