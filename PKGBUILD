# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-postgresql
pkgver=16.8
pkgrel=1
arch=('any')
pkgdesc="Sophisticated object-relational DBMS (Android ${_android_arch})"
url='https://www.postgresql.org/'
license=('custom:PostgreSQL')
groups=('android-postgresql')
depends=("android-${_android_arch}-icu"
         "android-${_android_arch}-openldap"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-libxslt"
         "android-${_android_arch}-lz4"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-readline"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-configure'
             'util-linux'
             "android-${_android_arch}-tcl"
             "tcl")
optdepends=("android-${_android_arch}-tcl: for PL/Tcl support")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2"
        '0001-Force-utf8-codeset.patch'
        '0002-Disable-unsupported-functions.patch'
        '0003-Disable-shm.patch'
        '0004-Fix-type-casting.patch'
        '0005-Added-missing-headers.patch'
        '0006-Fix-duplicate-case.patch'
        '0007-Unversioned-libs.patch')
md5sums=('f149a9f7aea0dbd66d366f70d6e7bda6'
         '4c19ab4024b4079e668117d79a9058b3'
         '75dad9c605ab1987c22e5b0da564dccb'
         '3305f78f93bed96409971e5ca269314d'
         'f88a4fb16aef45bbd6f01a912cd7a8fa'
         'f52a2e35dbb0bf71f4cc553ebd008c10'
         'd1e8c384acb46460750c1af057449578'
         '7bc0f291f718c4fc3181addf7c8d0b14')

prepare() {
    cd "${srcdir}/postgresql-${pkgver}"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        patch -p1 -i ../0001-Force-utf8-codeset.patch
        patch -p1 -i ../0003-Disable-shm.patch
    fi

    patch -p1 -i ../0002-Disable-unsupported-functions.patch
    patch -p1 -i ../0004-Fix-type-casting.patch
    patch -p1 -i ../0005-Added-missing-headers.patch
    patch -p1 -i ../0006-Fix-duplicate-case.patch
    patch -p1 -i ../0007-Unversioned-libs.patch

    sed -i 's|PTHREAD_LIBS="-lpthread"|PTHREAD_LIBS=""|g' configure
    sed -i 's|storage/lwlocknames.h|storage/lmgr/lwlocknames.h|g' src/include/storage/lwlock.h
    sed -i '/#define HAVE_SHM_OPEN/d' src/include/port.h

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 24 ]; then
        sed -i 's|fseeko|fseek|g' src/backend/utils/adt/genfile.c
        sed -i 's|fseeko|fseek|g' src/bin/pg_dump/pg_backup_archiver.c
        sed -i 's|ftello|ftell|g' src/bin/pg_dump/pg_backup_archiver.c
        sed -i 's|fseeko|fseek|g' src/bin/pg_dump/pg_backup_custom.c
        sed -i 's|ftello|ftell|g' src/bin/pg_dump/pg_backup_custom.c
        sed -i 's|fseeko|fseek|g' src/bin/pg_dump/pg_backup_tar.c
        sed -i 's|ftello|ftell|g' src/bin/pg_dump/pg_backup_tar.c
    fi
}

build() {
    cd "${srcdir}/postgresql-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -I${PWD}/src/backend"
    export CXXFLAGS="${CXXFLAGS} -I${PWD}/src/backend"
    export TCL_CONFIG_SH="${ANDROID_PREFIX_LIB}/tclConfig.sh"

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --with-libxml \
        --with-openssl \
        --with-tcl \
        --with-readline \
        --with-icu \
        --with-ldap \
        --with-libxslt \
        --with-lz4 \
        --with-zstd \
        --enable-nls \
        --enable-thread-safety \
        --disable-rpath
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/postgresql-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
