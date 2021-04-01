# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=gd
pkgname=lib32-gd
pkgver=2.3.2
pkgrel=1
pkgdesc="Library for the dynamic creation of images by programmers (32-bit)"
arch=('x86_64')
url="https://libgd.github.io/"
license=('custom')
depends=('lib32-fontconfig' 'lib32-libheif' 'lib32-libraqm' 'lib32-libtiff' 'lib32-libwebp'
         'lib32-libxpm' 'gd')
checkdepends=('ttf-liberation')
source=("https://github.com/libgd/libgd/archive/${_basename}-${pkgver}.tar.gz")
sha256sums=('dcc22244d775f469bee21dce1ea42552adbb72ba0cc423f9fa6a64601b3a1893')

build() {
    cd libgd-${_basename}-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./bootstrap.sh
    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --without-avif \
        --disable-rpath

    make
}

check() {
    cd libgd-${_basename}-${pkgver}

    make check || :
}

package() {
    cd libgd-${_basename}-${pkgver}

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}"/usr/bin
    rm -r "${pkgdir}"/usr/include

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
