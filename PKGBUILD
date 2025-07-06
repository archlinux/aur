# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=aarch64

pkgname=android-${_android_arch}-sqlite
# pkgbase=android-${_android_arch}-sqlite
# pkgname=("android-${_android_arch}-sqlite")
# pkgname+=("android-${_android_arch}-sqlite-tcl")
pkgver=3.50.2
_srcver=3490200
pkgrel=1
arch=('any')
pkgdesc="A C library that implements an SQL database engine (Android ${_android_arch})"
license=('LicenseRef-Sqlite')
url="https://www.sqlite.org/"
groups=('android-sqlite')
makedepends=('android-configure'
             "android-${_android_arch}-readline"
             "android-${_android_arch}-zlib")
#makedepends+=("android-${_android_arch}-tcl")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.sqlite.org/2025/sqlite-src-${_srcver}.zip")
md5sums=('e9e6dee0a5308225f75af8ad70a2eee2')

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
        -DSQLITE_ENABLE_MATH_FUNCTIONS"

    # Build fails with the TCL extension enabled, disable it for now.
    extra_options="--disable-tcl"

    ./configure \
        --host=${_android_arch/x86-/x86_}-linux-android \
        --build=${CHOST} \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --includedir=${ANDROID_PREFIX_INCLUDE} \
        --enable-shared \
        --enable-static \
        --fts4 \
        --fts5 \
        --rtree \
        ${extra_options} \
        TCLLIBDIR="${ANDROID_PREFIX_LIB}/sqlite${pkgver}"
    make $MAKEFLAGS
}

#package_android-aarch64-sqlite() {
package() {
    pkgdesc="A C library that implements an SQL database engine (Android ${_android_arch})"
    groups=('android-sqlite')
    depends=("android-${_android_arch}-readline"
             "android-${_android_arch}-zlib")

    cd "${srcdir}/sqlite-src-$_srcver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

#     # split out tcl extension
#     mkdir -p "${srcdir}/tcl"
#     mv -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/sqlite* "${srcdir}/tcl"
}

# package_android-aarch64-sqlite-tcl() {
#     pkgdesc="sqlite Tcl Extension Architecture (TEA) (Android ${_android_arch})"
#     groups=('android-sqlite-tcl')
#     depends=("android-${_android_arch}-sqlite")
#
#     cd "${srcdir}/sqlite-src-$_srcver"
#     source android-env ${_android_arch}
#
#     install -m755 -d "${pkgdir}/${ANDROID_PREFIX_LIB}"
#     mv -f "${srcdir}/tcl"/* "${pkgdir}/${ANDROID_PREFIX_LIB}"
# }
