# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Kazuo Teramoto <kaz.rag at gmail dot com>
# Contributor: damir <damir@archlinux.org>

_basename=libcdio
pkgname=lib32-libcdio
pkgver=2.2.0
pkgrel=1
pkgdesc="GNU Compact Disc Input and Control Library (32-bit)"
url="https://www.gnu.org/software/libcdio/"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(lib32-gcc-libs lib32-ncurses libcdio)
source=(https://github.com/libcdio/libcdio/releases/download/2.2.0/libcdio-${pkgver}.tar.bz2)
sha256sums=(6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539)

prepare() {
    cd "${_basename}-${pkgver}"

    autoreconf -fi
}

build() {
    export CC="gcc -m32 -D_LARGEFILE64_SOURCE"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd "${_basename}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --enable-cpp-progs \
        --disable-vcd-info \
        --without-cd-drive \
        --without-cd-info \
        --without-cdda-player \
        --without-cd-read \
        --without-iso-info \
        --without-iso-read \
        --disable-cddb

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${_basename}-${pkgver}"

    make -j1 DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/include" "${pkgdir}/usr/share"
}
