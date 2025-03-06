# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor:  David Runge <dvzrv@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-ncurses
pkgver=6.5
pkgrel=2
pkgdesc="System V Release 4.0 curses emulation library (Android ${_android_arch})"
arch=('any')
url='https://invisible-island.net/ncurses/ncurses.html'
license=('MIT')
depends=('android-ncurses')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://ftp.gnu.org/gnu/ncurses/ncurses-${pkgver}.tar.gz"
        "0001-Disable-lib-symlinks.patch")
md5sums=('ac2d2629296f04c8537ca706b6977687'
         'efc4d1176d6feb1981c218f17778281e')

prepare() {
    cd "${srcdir}/ncurses-${pkgver/_/-}"

    patch -Np1 -i ../0001-Disable-lib-symlinks.patch
}

build() {
    cd "${srcdir}/ncurses-${pkgver/_/-}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-root-access \
        --disable-root-environ \
        --disable-setuid-environ \
        --enable-widec \
        --enable-pc-files \
        --with-cxx-binding \
        --with-cxx-shared \
        --with-pkg-config-libdir="${ANDROID_PREFIX_LIB}/pkgconfig" \
        --with-shared \
        --with-xterm-kbs=del \
        --without-ada \
        --without-extra-suffix \
        --with-shlib-version=abi \
        --without-manpages \
        --without-progs \
        --without-tests
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/ncurses-${pkgver/_/-}"

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    # fool packages looking to link to non-wide-character ncurses libraries
    for lib in ncurses ncurses++ form panel menu; do
        ln -sv ${lib}w.pc "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/${lib}.pc"
    done

    # some packages look for -lcurses during build
    cp -p "${pkgdir}/${ANDROID_PREFIX_LIB}/libncursesw.so" "${pkgdir}/${ANDROID_PREFIX_LIB}/libcurses.so"

    # tic and ticinfo functionality is built in by default
    # make sure that anything linking against it links against libncursesw.so instead
    for lib in tic tinfo; do
        cp -p "${pkgdir}/${ANDROID_PREFIX_LIB}/libncursesw.so" "${pkgdir}/${ANDROID_PREFIX_LIB}/lib${lib}.so"
        ln -sv ncursesw.pc "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/${lib}.pc"
    done
}
