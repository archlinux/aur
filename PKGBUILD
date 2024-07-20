# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86-64

pkgname=android-${_android_arch}-brotli
pkgver=1.1.0
pkgrel=2
pkgdesc="Brotli compression library (Android ${_android_arch})"
arch=('any')
url='https://github.com/google/brotli.git'
license=('MIT')
groups=(android-brotli)
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake')
source=("https://github.com/google/brotli/archive/v${pkgver}.tar.gz")
md5sums=('3a6a3dba82a3604792d3cb0bd41bca60')

build() {
    cd "$srcdir/brotli-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF
    make -C build-static $MAKEFLAGS
}

package() {
    cd "$srcdir/brotli-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    for file in "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig"/*.pc; do
        sed -i 's| -R${libdir}||g' "$file"
    done
}
