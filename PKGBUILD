# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-tcl
pkgver=8.6.14
pkgrel=1
arch=('any')
pkgdesc="Powerful, easy-to-learn dynamic programming language (android)"
url="http://tcl.sourceforge.net/"
license=('custom')
depends=("android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
source=(https://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
sha256sums=('5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66')

prepare() {
    cd "${srcdir}/tcl${pkgver}"

    # we build the tcl sqlite interface in sqlite-tcl package
    rm -rf pkgs/sqlite3*
}

build() {
    cd "${srcdir}/tcl${pkgver}/unix"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
                enable64bit='--enable-64bit'
            ;;
        x86-64)
                enable64bit='--enable-64bit'
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        $enable64bit \
        --enable-threads
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/tcl${pkgver}/unix"
    source android-env ${_android_arch}

    make INSTALL_ROOT="${pkgdir}" install install-private-headers
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a

    # remove buildroot traces
    _tclver=8.6
    sed -e "s#${srcdir}/tcl${pkgver}/unix#${ANDROID_PREFIX_LIB}#" \
        -e "s#${srcdir}/tcl${pkgver}#${ANDROID_PREFIX_INCLUDE}#" \
        -e "s#'{/usr/lib} '#'${ANDROID_PREFIX_LIB}/tcl$_tclver'#" \
        -i "${pkgdir}/${ANDROID_PREFIX_LIB}/tclConfig.sh"

    tdbcver=tdbc1.1.7
    sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$tdbcver#${ANDROID_PREFIX_LIB}/$tdbcver#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/generic#${ANDROID_PREFIX_INCLUDE}#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/library#${ANDROID_PREFIX_LIB}/tcl${pkgver%.*}#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver#${ANDROID_PREFIX_INCLUDE}#" \
        -i "${pkgdir}/${ANDROID_PREFIX_LIB}/$tdbcver/tdbcConfig.sh"

    itclver=itcl4.2.4
    sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$itclver#${ANDROID_PREFIX_LIB}/$itclver#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver/generic#${ANDROID_PREFIX_INCLUDE}#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver#${ANDROID_PREFIX_INCLUDE}#" \
        -i "${pkgdir}/${ANDROID_PREFIX_LIB}/$itclver/itclConfig.sh"
}
