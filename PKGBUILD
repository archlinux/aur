# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-sqlite
pkgver=3.51.2
_srcver=$(echo "${pkgver}" | awk -F. '{ printf "%d%02d%02d00", $1, $2, $3 }')
pkgrel=1
arch=('any')
pkgdesc="A C library that implements an SQL database engine (Android ${_android_arch})"
license=('LicenseRef-Sqlite')
url="https://www.sqlite.org/"
groups=('android-sqlite')
depends=("android-${_android_arch}-zlib")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.sqlite.org/2026/sqlite-src-${_srcver}.zip")
md5sums=('5089e70213906d8ffd3ddc67377d31d7')

build() {
    cd "${srcdir}/sqlite-src-${_srcver}"
    source android-env ${_android_arch}

    # this uses malloc_usable_size, which is incompatible with fortification level 3
    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    export CPPFLAGS="${CPPFLAGS} \
        -DSQLITE_ENABLE_COLUMN_METADATA=1 \
        -DSQLITE_ENABLE_UNLOCK_NOTIFY \
        -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
        -DSQLITE_ENABLE_FTS3_TOKENIZER=1 \
        -DSQLITE_ENABLE_FTS3_PARENTHESIS \
        -DSQLITE_SECURE_DELETE \
        -DSQLITE_ENABLE_STMTVTAB \
        -DSQLITE_ENABLE_STAT4 \
        -DSQLITE_MAX_VARIABLE_NUMBER=250000 \
        -DSQLITE_MAX_EXPR_DEPTH=10000 \
        -DSQLITE_ENABLE_MATH_FUNCTIONS \
        -DSQLITE_ENABLE_RTREE=1 \
        -DSQLITE_ENABLE_FTS5=1 \
        -DSQLITE_ENABLE_JSON1=1"

    ./configure \
        --host=${_android_arch/x86-/x86_}-linux-android \
        --build=${CHOST} \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --enable-shared \
        --enable-static \
        --disable-readline \
        --disable-tcl \
        --fts4 \
        --fts5 \
        --rtree
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/sqlite-src-$_srcver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
