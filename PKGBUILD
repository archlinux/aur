# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=gd
pkgname=lib32-gd
pkgver=2.3.3
pkgrel=2
pkgdesc="Library for the dynamic creation of images by programmers (32-bit)"
arch=('x86_64')
url="https://libgd.github.io/"
license=('custom')
depends=('lib32-fontconfig' 'lib32-libheif' 'lib32-libraqm' 'lib32-libtiff' 'lib32-libwebp'
         'lib32-libxpm' 'gd')
checkdepends=('ttf-liberation')
source=("https://github.com/libgd/libgd/archive/${_basename}-${pkgver}.tar.gz"
        'https://github.com/libgd/libgd/commit/bdc281eadb1d58d5c0c7bbc1125ee4674256df08.patch')
sha256sums=('24429f9d0dbe0f865aaa4b1a63558242396ba9134e6cfd32ca5e486a84483350'
            '1e7bdb17e76ad6b1384222b449b9011ee131d3e1f105f9b30495a9c34b2cd5eb')

prepare() {
    cd libgd-${_basename}-${pkgver}

    # Re-add macros that are used in PHP
    # See https://github.com/php/php-src/pull/7490
    patch -p1 -R -i "$srcdir/bdc281eadb1d58d5c0c7bbc1125ee4674256df08.patch"
}

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

    TMP=$(mktemp -d) make check || :
}

package() {
    cd libgd-${_basename}-${pkgver}

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}"/usr/bin
    rm -r "${pkgdir}"/usr/include

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
