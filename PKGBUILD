# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

_android_arch=riscv64

pkgname=android-${_android_arch}-libssh2
pkgver=1.11.1
pkgrel=1
arch=('any')
pkgdesc="Library for accessing ssh client services through C libraries (Android ${_android_arch})"
license=('LGPL')
url="https://www.libssh2.org/"
groups=('android-libssh2')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-openssl")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake')
source=("https://www.libssh2.org/download/libssh2-${pkgver}.tar.gz"{,.asc})
md5sums=('38857d10b5c5deb198d6989dacace2e6'
         'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2'   # Daniel Stenberg
              '914C533DF9B2ADA2204F586D78E11C6B279D5C91')  # Daniel Stenberg (old key)

build() {
    cd "${srcdir}/libssh2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTING=OFF \
        -DENABLE_ZLIB_COMPRESSION=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DOPENSSL_ROOT_DIR="${ANDROID_PREFIX}" \
        -DOPENSSL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPENSSL_CRYPTO_LIBRARY="${ANDROID_PREFIX_LIB}/libcrypto.so" \
        -DOPENSSL_SSL_LIBRARY:FILEPATH="${ANDROID_PREFIX_LIB}/libssl.so"
    cmake --build build
}

package(){
    cd "${srcdir}/libssh2-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" cmake --install build
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
