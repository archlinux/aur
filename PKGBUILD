# $Id: PKGBUILD 298837 2018-02-26 21:27:42Z eschwartz $
# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Kazuo Teramoto <kaz.rag at gmail dot com>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-libcdio
_pkgname=libcdio
pkgver=2.0.0
pkgrel=1
pkgdesc="GNU Compact Disc Input and Control Library (32-bit)"
arch=('x86_64')
license=('GPL3')
url="https://www.gnu.org/software/libcdio/"
depends=('lib32-gcc-libs' "libcdio")
source=(https://ftp.gnu.org/gnu/libcdio/${_pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('1b481b5da009bea31db875805665974e2fc568e2b2afa516f4036733657cf958'
            'SKIP')
validpgpkeys=('DAA63BC2582034A02B923D521A8DE5008275EC21') # R. Bernstein

prepare() {
  cd ${_pkgname}-${pkgver}
  autoreconf -fi
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd ${_pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-vcd-info --enable-cpp-progs \
        --libdir=/usr/lib32 --without-cd-drive --without-cd-info \
        --without-cdda-player --without-cd-read --without-iso-info \
        --without-iso-read --disable-cddb
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make -j1 DESTDIR="${pkgdir}" install

    rm -rf ${pkgdir}/usr/bin ${pkgdir}/usr/include ${pkgdir}/usr/share
}
