# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Christian Hesse <eworm@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-mariadb
pkgdesc="Fast SQL database server, derived from MySQL (Android ${_android_arch})"
pkgver=11.4.2
pkgrel=1
arch=('any')
license=('GPL')
url='https://mariadb.org/'
depends=("android-${_android_arch}-bzip2"
         "android-${_android_arch}-jemalloc"
         "android-${_android_arch}-liburing"
         "android-${_android_arch}-libxcrypt"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-lz4"
         "android-${_android_arch}-lzo"
         "android-${_android_arch}-ncurses"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-pcre2"
         "android-${_android_arch}-snappy"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-cmake'
             "android-${_android_arch}-boost"
             "android-${_android_arch}-bzip2"
             "android-${_android_arch}-cracklib"
             "android-${_android_arch}-curl"
             "android-${_android_arch}-jemalloc"
             "android-${_android_arch}-judy"
             "android-${_android_arch}-liburing"
             "android-${_android_arch}-libxcrypt"
             "android-${_android_arch}-libxml2"
             "android-${_android_arch}-lz4"
             "android-${_android_arch}-openssl"
             "android-${_android_arch}-pcre2"
             "android-${_android_arch}-xz"
             "android-${_android_arch}-zlib"
             "android-${_android_arch}-zstd")
optdepends=("android-${_android_arch}-cracklib: for cracklib plugin"
            "android-${_android_arch}-curl: for ha_s3 plugin"
            "android-${_android_arch}-judy: for Open Query GRAPH (OQGraph) computation engine"
            "android-${_android_arch}-xz: lzma provider")
options=(!strip !buildflags staticlibs !emptydirs)
# The default links with mirror redirection fail for signatures, specific
# mirrors may be out of date every now and then. Let's use the upstream
# rsync source via https and hope it does not hurt them too much.
# https://mariadb.com/kb/en/library/mirror-sites-for-mariadb/
source=("https://rsync.osuosl.org/pub/mariadb/mariadb-${pkgver}/source/mariadb-${pkgver}.tar.gz"{,.asc}
        '0001-Disable-gssapi.patch'
        '0002-Remove-setpwent.patch'
        '0003-Remove-strchr.patch'
        '0004-Dont-read-PEM-keys.patch'
        '0005-Add-missing-headers.patch'
        '0006-Remove-endpwent.patch'
        '0008-Fix-ncurses-headers.patch')
sha256sums=('8c600e38adb899316c1cb11c68b87979668f4fb9d858000e347e6d8b7abe51b0'
            'SKIP'
            '387ad00885efee2cfad861445c477121dcda294df3112204fb3197235254f7d0'
            'f38a62d8fcf13a63c1368816ae9f97505f73343941ca667d91adf8f51176787e'
            '281f85613b325d1cc35ea3701d8a7cb54971389a23ad9e90df0214d3672174d5'
            'd025b6710cbca6e64d395b322d622ef1b1bb868893ee0550150d5ff5000c2d57'
            '21529ea4e45530f43b393e117b9263ad5b19c452d67396b6fe8cfc7651b9296b'
            '909d2b7893864c31dea42b92e1593d4dc9abecfa5db50fd5c0a3864e72023d2f'
            'f9dccbec9b8bc20aacfc73c92dac3a0496ab9eaac5d772b991e943a232163eb1')
validpgpkeys=('177F4010FE56CA3336300305F1656F24C74CD1D8') # MariaDB Signing Key <signing-key@mariadb.org>

prepare() {
    cd "${srcdir}/mariadb-$pkgver"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Disable-gssapi.patch
    patch -Np1 -i ../0003-Remove-strchr.patch
    patch -Np1 -i ../0004-Dont-read-PEM-keys.patch
    patch -Np1 -i ../0005-Add-missing-headers.patch
    patch -Np1 -i ../0008-Fix-ncurses-headers.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        patch -Np1 -i ../0002-Remove-setpwent.patch
        patch -Np1 -i ../0006-Remove-endpwent.patch
    fi

    sed -i 's|ushort|unsigned short|g' libmariadb/plugins/auth/my_auth.c
    sed -i 's|ushort|unsigned short|g' libmariadb/libmariadb/mariadb_lib.c
    sed -i 's|ushort|unsigned short|g' libmariadb/libmariadb/mariadb_stmt.c
    sed -i 's|ushort|unsigned short|g' libmariadb/libmariadb/ma_stmt_codec.c

    rm -rf plugin/auth_gssapi
    rm -f libmariadb/cmake/FindGSSAPI.cmake
}

build() {
    cd "${srcdir}/mariadb-$pkgver"

    unset CC
    unset CXX
    unset CFLAGS
    unset CPPFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    unset AR
    unset LD
    unset NM
    unset OBJCOPY
    unset OBJDUMP
    unset RANLIB
    unset STRIP

    cmake -S . -B cross-build
    make -C cross-build import_executables

    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -I${PWD}/include"
    export CXXFLAGS="${CXXFLAGS} -I${PWD}/include"
    export PATH="${PWD}/cross-build/strings:${PATH}"

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCOMPILATION_COMMENT="Android ${ANDROID_MINIMUM_PLATFORM} ${_android_arch}" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -Wno-dev \
        -DIMPORT_EXECUTABLES="${PWD}/cross-build/import_executables.cmake" \
        -DINSTALL_SYSCONFDIR="${ANDROID_PREFIX_ETC}" \
        -DINSTALL_SYSCONF2DIR="${ANDROID_PREFIX_ETC}/my.cnf.d" \
        -DINSTALL_UNIX_ADDRDIR=/run/mysqld/mysqld.sock \
        -DINSTALL_SCRIPTDIR=bin \
        -DINSTALL_INCLUDEDIR=include/mysql \
        -DINSTALL_PLUGINDIR=lib/mysql/plugin \
        -DINSTALL_SHAREDIR=share \
        -DINSTALL_SUPPORTFILESDIR=share/mysql \
        -DINSTALL_MYSQLSHAREDIR=share/mysql \
        -DINSTALL_DOCREADMEDIR=share/doc/mariadb \
        -DINSTALL_DOCDIR=share/doc/mariadb \
        -DINSTALL_MANDIR=share/man \
        -DMYSQL_DATADIR="${ANDROID_PREFIX_VAR}/lib/mysql" \
        -DDEFAULT_CHARSET=utf8mb4 \
        -DDEFAULT_COLLATION=utf8mb4_unicode_ci \
        -DENABLED_LOCAL_INFILE=ON \
        -DPLUGIN_EXAMPLE=NO \
        -DPLUGIN_FEDERATED=NO \
        -DPLUGIN_FEEDBACK=NO \
        -DWITH_EXTRA_CHARSETS=complex \
        -DWITH_JEMALLOC=ON \
        -DWITH_LIBWRAP=OFF \
        -DWITH_PCRE2=system \
        -DWITH_READLINE=ON \
        -DWITH_SSL=system \
        -DWITH_UNIT_TESTS=OFF \
        -DWITH_ZLIB=system \
        -DWITH_SYSTEMD=no \
        -DWITHOUT_SERVER=ON \
        -DAUTH_GSSAPI_PLUGIN_TYPE=OFF \
        -DCMAKE_C_FLAGS="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
        -DOPENSSL_ROOT_DIR="${ANDROID_PREFIX}" \
        -DOPENSSL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOPENSSL_CRYPTO_LIBRARY="${ANDROID_PREFIX_LIB}/libcrypto.so" \
        -DOPENSSL_SSL_LIBRARY="${ANDROID_PREFIX_LIB}/libssl.so" \
        -DCURSES_INCLUDE_PATH="${ANDROID_PREFIX_INCLUDE}" \
        -DCURSES_LIBRARY="${ANDROID_PREFIX_LIB}/libcurses.so" \
        -DCURL_LIBRARY="${ANDROID_PREFIX_LIB}/libcurl.so" \
        -DCURL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZSTD_LIBRARIES="${ANDROID_PREFIX_LIB}/libzstd.so" \
        -DZSTD_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DLIBXML2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DBoost_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DBZIP2_LIBRARIES="${ANDROID_PREFIX_LIB}/libbz2.so" \
        -DBZIP2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLZ4_LIBRARIES="${ANDROID_PREFIX_LIB}/liblz4.so" \
        -DLZ4_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DLZO_LIBRARIES="${ANDROID_PREFIX_LIB}/liblzo2.so" \
        -DLZO_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DLIBLZMA_LIBRARY="${ANDROID_PREFIX_LIB}/liblzma.so" \
        -DLIBLZMA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSNAPPY_LIBRARIES="${ANDROID_PREFIX_LIB}/libsnappy.so" \
        -DSNAPPY_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DJudy_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DJudy_LIBRARIES="${ANDROID_PREFIX_LIB}/libljudy.so"
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/mariadb-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    files=(mariadb
           mariadb_config
           mariadb-admin
           mariadb-binlog
           mariadb-check
           mariadb-config
           mariadb-conv
           mariadb-dump
           mariadb-import
           mariadb-plugin
           mariadb-show
           mariadb-slap
           mariadb-test
           mariadb-waitpid
           my_print_defaults
           mysql
           mysql_plugin
           mysql_waitpid
           mysqladmin
           mysqlbinlog
           mysqlcheck
           mysqldump
           mysqlimport
           mysqlshow
           mysqlslap
           mysqltest
           replace
           resolve_stack_dump)

    for f in "${files[@]}"; do
        rm -f "${pkgdir}/${ANDROID_PREFIX_BIN}/${f}"
    done

    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
