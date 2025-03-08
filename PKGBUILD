# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd <jvinet@zeroflux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libevent
pkgver=2.1.12
pkgrel=4
arch=('any')
pkgdesc="Event notification library (Android ${_android_arch})"
url="https://libevent.org/"
license=('BSD')
groups=('android-libevent')
depends=("android-${_android_arch}-openssl")
makedepends=("android-${_android_arch}-zlib"
             'android-cmake'
             'python')
optdepends=('python: event_rpcgen.py')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libevent/libevent/releases/download/release-${pkgver}-stable/libevent-${pkgver}-stable.tar.gz"{,.asc}
        '0001-Force-compile-with-pthreads.patch')
md5sums=('b5333f021f880fe76490d8a799cd79f4'
         'SKIP'
         'ca30170e21ddd2718fd28a155c7c3f38')
validpgpkeys=('B35BF85BF19489D04E28C33C21194EBB165733EA'
              '9E3AC83A27974B84D1B3401DB86086848EF8686D')

prepare() {
    cd "${srcdir}/libevent-${pkgver}-stable"

    patch -Np1 -i ../0001-Force-compile-with-pthreads.patch
}

build() {
    cd "${srcdir}/libevent-${pkgver}-stable"
    source android-env ${_android_arch}

    # Build shared library

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=FALSE \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DEVENT__LIBRARY_TYPE=SHARED \
        -DEVENT__DISABLE_REGRESS=OFF \
        -DEVENT__DOXYGEN=OFF \
        -DEVENT__DISABLE_TESTS=ON \
        -DEVENT__DISABLE_SAMPLES=ON \
        -DOPENSSL_ROOT_DIR="${ANDROID_PREFIX}" \
        -DOPENSSL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPENSSL_CRYPTO_LIBRARY="${ANDROID_PREFIX_LIB}/libcrypto.so" \
        -DOPENSSL_SSL_LIBRARY="${ANDROID_PREFIX_LIB}/libssl.so" \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    # Build static library

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=FALSE \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DEVENT__LIBRARY_TYPE=STATIC \
        -DEVENT__DISABLE_REGRESS=OFF \
        -DEVENT__DOXYGEN=OFF \
        -DEVENT__DISABLE_TESTS=ON \
        -DEVENT__DISABLE_SAMPLES=ON \
        -DOPENSSL_ROOT_DIR="${ANDROID_PREFIX}" \
        -DOPENSSL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPENSSL_CRYPTO_LIBRARY="${ANDROID_PREFIX_LIB}/libcrypto.a" \
        -DOPENSSL_SSL_LIBRARY="${ANDROID_PREFIX_LIB}/libssl.a" \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/libevent-${pkgver}-stable"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
