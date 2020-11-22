# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=gd
pkgname=lib32-gd
pkgver=2.3.0
pkgrel=1
pkgdesc="Library for the dynamic creation of images by programmers (32-bit)"
arch=('x86_64')
url="https://libgd.github.io/"
license=('custom')
depends=('lib32-fontconfig' 'lib32-libtiff' 'lib32-libwebp' 'lib32-libxpm' 'gd')
checkdepends=('ttf-liberation')
source=("https://github.com/libgd/libgd/releases/download/gd-${pkgver}/libgd-${pkgver}.tar.xz")
sha1sums=('ec75c84aa6326a7ade3302d5c18471f440b2ca1e')

build() {
    cd libgd-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --disable-rpath

    make
}

check() {
    cd libgd-${pkgver}

    make check || :
}

package() {
    cd libgd-${pkgver}

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}"/usr/bin
    rm -r "${pkgdir}"/usr/include

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
