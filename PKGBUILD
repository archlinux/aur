# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=armv7a-eabi

pkgbase=android-${_android_arch}-sqlite
pkgname=("android-${_android_arch}-sqlite"
         "android-${_android_arch}-sqlite-tcl")
pkgver=3.45.2
_srcver=3450200
pkgrel=1
arch=('any')
pkgdesc="A C library that implements an SQL database engine (Android, ${_android_arch})"
license=('LicenseRef-Sqlite')
url="https://www.sqlite.org/"
makedepends=('android-configure'
             "android-${_android_arch}-tcl"
             "android-${_android_arch}-readline"
             "android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.sqlite.org/2024/sqlite-src-${_srcver}.zip")
sha256sums=('4a45a3577cc8af683c4bd4c6e81a7c782c5b7d5daa06175ea2cb971ca71691b1')

prepare() {
    cd "${srcdir}/sqlite-src-$_srcver"
    source android-env ${_android_arch}

    autoreconf -vfi
}

build() {
    cd "${srcdir}/sqlite-src-$_srcver"
    source android-env ${_android_arch}

    # this uses malloc_usable_size, which is incompatible with fortification level 3
    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    export CPPFLAGS="$CPPFLAGS \
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
        -DSQLITE_ENABLE_MATH_FUNCTIONS"

    android-${_android_arch}-configure \
        --enable-threadsafe \
        --enable-readline \
        --enable-fts3 \
        --enable-fts4 \
        --enable-fts5 \
        --enable-rtree \
        --enable-json1 \
        --enable-session \
        TCLLIBDIR="${ANDROID_PREFIX_LIB}/sqlite$pkgver"
    make $MAKEFLAGS
}

package_android-armv7a-eabi-sqlite() {
    pkgdesc="A C library that implements an SQL database engine (Android, ${_android_arch})"
    depends=("android-${_android_arch}-readline"
             "android-${_android_arch}-zlib")

    cd "${srcdir}/sqlite-src-$_srcver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so

    # split out tcl extension
    mkdir -p "$srcdir"/tcl
    mv -f "$pkgdir/${ANDROID_PREFIX_LIB}"/sqlite* "$srcdir"/tcl
}

package_android-armv7a-eabi-sqlite-tcl() {
    pkgdesc="sqlite Tcl Extension Architecture (TEA) (Android, ${_android_arch})"
    depends=("android-${_android_arch}-sqlite")

    cd "${srcdir}/sqlite-src-$_srcver"
    source android-env ${_android_arch}

    install -m755 -d "${pkgdir}/${ANDROID_PREFIX_LIB}"
    mv -f "$srcdir"/tcl/* "${pkgdir}/${ANDROID_PREFIX_LIB}"
}
