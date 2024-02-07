# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor:  David Runge <dvzrv@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-ncurses
pkgver=6.4_20240203
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library (android)'
arch=('any')
url='https://invisible-island.net/ncurses/ncurses.html'
license=('MIT')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://invisible-mirror.net/archives/ncurses/current/ncurses-${pkgver/_/-}.tgz"
        "0001-Disable-lib-symlinks.patch")
sha256sums=('33a79f39c0dc6a1f0fd16e711ea67dbe80cdb62488ad721a8594785bb5084b70'
            'ff16e8e4418660d7eea17caa2678d9a962f65ed15d523ce906e55d616eb89b9d')

prepare() {
    cd ncurses-${pkgver/_/-}

    patch -Np1 -i ../0001-Disable-lib-symlinks.patch
}

build() {
    cd ncurses-${pkgver/_/-}
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-root-access \
        --disable-root-environ \
        --disable-setuid-environ \
        --enable-widec \
        --enable-pc-files \
        --with-cxx-binding \
        --with-cxx-shared \
        --with-pkg-config-libdir=${ANDROID_PREFIX_LIB}/pkgconfig \
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
    cd ncurses-${pkgver/_/-}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so.*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a

    # fool packages looking to link to non-wide-character ncurses libraries
    for lib in ncurses ncurses++ form panel menu; do
        ln -sv ${lib}w.pc "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/${lib}.pc"
    done

    # some packages look for -lcurses during build
    cp -p "$pkgdir/${ANDROID_PREFIX_LIB}/libncursesw.so" "$pkgdir/${ANDROID_PREFIX_LIB}/libcurses.so"

    # tic and ticinfo functionality is built in by default
    # make sure that anything linking against it links against libncursesw.so instead
    for lib in tic tinfo; do
        cp -p "$pkgdir/${ANDROID_PREFIX_LIB}/libncursesw.so" "$pkgdir/${ANDROID_PREFIX_LIB}/lib${lib}.so"
        ln -sv ncursesw.pc "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/${lib}.pc"
    done
}
