# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor 03/08/04 <lefungus@altern.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libmatroska
pkgver=1.7.1
pkgrel=2
arch=('any')
pkgdesc="Matroska library (Android ${_android_arch})"
url='https://github.com/Matroska-Org/libmatroska'
license=('LGPL2.1')
groups=('android-libmatroska')
depends=("android-${_android_arch}-libebml")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/Matroska-Org/libmatroska/archive/refs/tags/release-${pkgver}.tar.gz")
md5sums=('ef677bdd7ce5559253e1c9211d68ec7d')

build() {
    cd "${srcdir}/libmatroska-release-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=ON \
        -DEBML_DIR="${ANDROID_PREFIX_LIB}/cmake/EBML" \
        -Wno-dev
    make -C build-shared

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=OFF \
        -DEBML_DIR="${ANDROID_PREFIX_LIB}/cmake/EBML" \
        -Wno-dev
    make -C build-shared
}

package() {
    cd "${srcdir}/libmatroska-release-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
