# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-brotli
pkgver=1.1.0
pkgrel=1
pkgdesc='Brotli compression library (android)'
arch=('any')
url='https://github.com/google/brotli.git'
license=('MIT')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake' 'git')
source=("https://github.com/google/brotli/archive/v${pkgver}.tar.gz")
md5sums=('3a6a3dba82a3604792d3cb0bd41bca60')

build() {
    cd "$srcdir/brotli-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake .
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/brotli-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so

    for file in "${pkgdir}"/${ANDROID_PREFIX_LIB}/pkgconfig/*.pc; do
        sed -i 's| -R${libdir}||g' "$file"
    done
}
