# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libssh
pkgver=0.10.6
pkgrel=1
arch=('any')
pkgdesc="Library for accessing ssh client services through C libraries (Android ${_android_arch})"
license=('LGPL')
url="https://www.libssh.org/"
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-openssl")
groups=('android-libssh')
makedepends=('android-cmake'
             'doxygen'
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.libssh.org/files/${pkgver%.*}/libssh-$pkgver.tar.xz"
        '0001-Fix-static-lib.patch')
md5sums=('5f46371aa8bfa7e6bff7f2a6f3edf80e'
         '66588a420aac9c580c31018a5b1c78cf')

prepare() {
    cd "${srcdir}/libssh-${pkgver}"

    # Disable automatic detection of openssl since it picks up openssl-1.0
    sed 's/find_package(OpenSSL)/#find_package(OpenSSL)/' -i CMakeLists.txt

    patch -Np1 -i "../0001-Fix-static-lib.patch"
}

build() {
    cd "${srcdir}/libssh-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -D__USE_BSD"
    export CXXFLAGS="${CXXFLAGS} -D__USE_BSD"

    version=$(cat ${ANDROID_PREFIX_INCLUDE}/openssl/opensslv.h | grep "OPENSSL_VERSION_TEXT" | sed 's/^[^\"]*"OpenSSL //' | sed 's/ .*$//')
    libssl=${ANDROID_PREFIX_LIB}/libssl.so
    libcrypto=${ANDROID_PREFIX_LIB}/libcrypto.so

    #static build
    mkdir -p "${srcdir}"/build-static && cd "${srcdir}"/build-static

    android-${_android_arch}-cmake \
        -DCMAKE_INSTALL_PREFIX=${ANDROID_PREFIX} \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_GSSAPI=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_STATIC_LIB:BOOL=ON \
        -DOPENSSL_FOUND:BOOL=ON \
        -DOPENSSL_INCLUDE_DIR:FILEPATH=${ANDROID_PREFIX_INCLUDE}/ \
        -DOPENSSL_SSL_LIBRARY:FILEPATH="$libssl" \
        -DOPENSSL_CRYPTO_LIBRARY:FILEPATH="$libcrypto" \
        -DOPENSSL_VERSION:STRING="$version" \
        -DUNIT_TESTING=OFF \
        -DWITH_EXAMPLES=OFF \
        ../libssh-${pkgver}

    make $MAKEFLAGS

    mkdir -p "${srcdir}"/build-dynamic && cd "${srcdir}"/build-dynamic

    android-${_android_arch}-cmake \
        -DCMAKE_INSTALL_PREFIX=${ANDROID_PREFIX} \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_GSSAPI=OFF \
        -DWITH_STATIC_LIB=ON \
        -DOPENSSL_FOUND:BOOL=ON \
        -DOPENSSL_INCLUDE_DIR:FILEPATH=${ANDROID_PREFIX_INCLUDE}/ \
        -DOPENSSL_SSL_LIBRARY:FILEPATH="$libssl" \
        -DOPENSSL_CRYPTO_LIBRARY:FILEPATH="$libcrypto" \
        -DOPENSSL_VERSION:STRING="$version" \
        -DUNIT_TESTING=OFF \
        -DWITH_EXAMPLES=OFF \
        ../libssh-${pkgver}

    make $MAKEFLAGS
}

package(){
    cd "${srcdir}/libssh-${pkgver}"
    source android-env ${_android_arch}

    # install static library
    cd "${srcdir}"/build-static
    make DESTDIR="${pkgdir}" install

    cd "${srcdir}"/build-dynamic
    make DESTDIR="${pkgdir}" install

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
