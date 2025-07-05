# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-libssh
pkgver=0.11.2
pkgrel=1
arch=('any')
pkgdesc="Library for accessing ssh client services through C libraries (Android ${_android_arch})"
license=('LGPL')
url="https://www.libssh.org/"
groups=('android-libssh')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-openssl")
makedepends=('android-cmake'
             'doxygen'
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.libssh.org/files/${pkgver%.*}/libssh-${pkgver}.tar.xz"
        '0001-Fix-static-lib.patch'
        '0002-Disable-getifaddrs.patch')
md5sums=('7e9afb4cf63abbcd8bc448124dfdf3fa'
         '66588a420aac9c580c31018a5b1c78cf'
         '063230102f24f4bcb8aea86575e00def')

prepare() {
    cd "${srcdir}/libssh-${pkgver}"
    source android-env ${_android_arch}

    # Disable automatic detection of openssl since it picks up openssl-1.0
    sed 's/find_package(OpenSSL)/#find_package(OpenSSL)/' -i CMakeLists.txt

    patch -Np1 -i ../0001-Fix-static-lib.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 24 ]; then
        patch -Np1 -i ../0002-Disable-getifaddrs.patch
    fi
}

build() {
    cd "${srcdir}/libssh-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -D__USE_BSD"
    export CXXFLAGS="${CXXFLAGS} -D__USE_BSD"

    version=$(cat "${ANDROID_PREFIX_INCLUDE}/openssl/opensslv.h" | grep "OPENSSL_VERSION_TEXT" | sed 's/^[^\"]*"OpenSSL //' | sed 's/ .*$//')

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DWITH_GSSAPI=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DOPENSSL_FOUND=ON \
        -DOPENSSL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPENSSL_SSL_LIBRARY="${ANDROID_PREFIX_LIB}/libssl.so" \
        -DOPENSSL_CRYPTO_LIBRARY="${ANDROID_PREFIX_LIB}/libcrypto.so" \
        -DOPENSSL_VERSION="${version}" \
        -DUNIT_TESTING=OFF \
        -DWITH_EXAMPLES=OFF
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DWITH_GSSAPI=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -DOPENSSL_FOUND=ON \
        -DOPENSSL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPENSSL_SSL_LIBRARY="${ANDROID_PREFIX_LIB}/libssl.a" \
        -DOPENSSL_CRYPTO_LIBRARY="${ANDROID_PREFIX_LIB}/libcrypto.a" \
        -DOPENSSL_VERSION="${version}" \
        -DUNIT_TESTING=OFF \
        -DWITH_EXAMPLES=OFF
    make -C build-static $MAKEFLAGS
}

package(){
    cd "${srcdir}/libssh-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
