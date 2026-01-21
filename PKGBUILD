# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Christian Hesse <eworm@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-mariadb
pkgdesc="Fast SQL database server, derived from MySQL (Android ${_android_arch})"
pkgver=12.1.2
pkgrel=1
arch=('any')
license=('GPL')
url='https://mariadb.org/'
groups=('android-mariadb')
depends=("android-${_android_arch}-curl"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-cmake')
optdepends=("android-${_android_arch}-curl: for ha_s3 plugin")
options=(!strip !buildflags staticlibs !emptydirs)
# The default links with mirror redirection fail for signatures, specific
# mirrors may be out of date every now and then. Let's use the upstream
# rsync source via https and hope it does not hurt them too much.
# https://mariadb.com/kb/en/library/mirror-sites-for-mariadb/
source=("https://rsync.osuosl.org/pub/mariadb/mariadb-${pkgver}/source/mariadb-${pkgver}.tar.gz"{,.asc}
        '0004-Dont-read-PEM-keys.patch')
md5sums=('ccddcc219867b833521c279eb739191d'
         'SKIP'
         '05ce29a22db5d51618eb62fd01cf77ed')
validpgpkeys=('177F4010FE56CA3336300305F1656F24C74CD1D8') # MariaDB Signing Key <signing-key@mariadb.org>

prepare() {
    cd "${srcdir}/mariadb-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0004-Dont-read-PEM-keys.patch
    sed -i 's|"lib/mariadb"|"lib"|g' libmariadb/cmake/install.cmake
}

build() {
    cd "${srcdir}/mariadb-${pkgver}/libmariadb"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_EXTERNAL_ZLIB=ON \
        -DWITH_ZSTD=system \
        -DWITH_UNIT_TESTS=OFF \
        -DZLIB_BUILD_EXAMPLES=OFF \
        -DINSTALL_MANDIR=share/man \
        -DOPENSSL_ROOT_DIR="${ANDROID_PREFIX}" \
        -DOPENSSL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPENSSL_CRYPTO_LIBRARY="${ANDROID_PREFIX_LIB}/libcrypto.so" \
        -DOPENSSL_SSL_LIBRARY="${ANDROID_PREFIX_LIB}/libssl.so" \
        -DZSTD_LIBRARIES="${ANDROID_PREFIX_LIB}/libzstd.so" \
        -DZSTD_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DCURL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DCURL_LIBRARY="${ANDROID_PREFIX_LIB}/libcurl.so" \
        -Dpkgcfg_lib_PC_CURL_curl="${ANDROID_PREFIX_LIB}/pkgconfig/libcurl.pc"
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/mariadb-${pkgver}/libmariadb"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 COPYING.LIB -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
