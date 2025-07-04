# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-taglib
pkgver=2.1.1
pkgrel=1
arch=('any')
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (Android ${_android_arch})"
url='https://taglib.github.io/'
license=('LGPL-2.1-only'
         'MPL-1.1')
groups=('android-taglib')
depends=("android-${_android_arch}-zlib")
makedepends=('cmake'
             "android-${_android_arch}-utf8cpp")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://taglib.github.io/releases/taglib-${pkgver}.tar.gz")
md5sums=('9feffe76b4643eb724185310879c3123')

build() {
    cd "${srcdir}/taglib-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
        -Dutf8cpp_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/utf8cpp"
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
        -Dutf8cpp_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/utf8cpp"
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/taglib-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
