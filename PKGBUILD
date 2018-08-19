# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libtiger
pkgname=lib32-libtiger
pkgver=0.3.4
pkgrel=3
pkgdesc="A rendering library for Kate streams using Pango and Cairo (32-bit)"
url="http://git.xiph.org/?p=users/oggk/tiger.git;a=summary"
license=('LGPL')
arch=('x86_64')
depends=('lib32-pango' 'lib32-libkate' 'libtiger')
makedepends=('pkg-config' 'git')
source=("$_basename::git+git://git.xiph.org/users/oggk/tiger.git#tag=tiger-$pkgver"
        "0001-Fix-automake.patch")
sha256sums=('SKIP'
            'fa257ad2dfceb6709633e6515bbbe04b8dad5bcb3c9226c7b5d2b3871336b6f4')

prepare() {
    cd $_basename

    patch -Np1 -i "${srcdir}/0001-Fix-automake.patch"

    ./autogen.sh
}

build() {
    cd $_basename

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --enable-static=no \
        --disable-doc

    make
}

package() {
    cd $_basename

    make DESTDIR="${pkgdir}" install

    cd "$pkgdir"/usr

    rm -r include
}
