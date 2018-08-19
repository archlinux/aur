# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libkate
pkgname="lib32-$_basename"
pkgver=0.4.1
pkgrel=3
pkgdesc="A karaoke and text codec for embedding in ogg (32-bit)"
url="https://wiki.xiph.org/OggKate"
license=('BSD')
arch=('x86_64')
depends=('lib32-libogg' 'lib32-libpng' 'libkate')
makedepends=('pkg-config' 'git')
source=("$_basename::git+git://git.xiph.org/users/oggk/kate.git#tag=kate-${pkgver}"
        0001-Fix-automake-warnings.patch)
sha512sums=('SKIP'
            '525d120cddd040441859f2783e6e566da631ba304074bfa40a34399879fc3053577e8e71ef804168aeef519fac62e205829b50a61d770cddd46f7dbfba660842')

prepare() {
    cd $_basename

    patch -Np1 -i "$srcdir/0001-Fix-automake-warnings.patch"

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
        --disable-static \
        --disable-doc

    make
}

package() {
    cd $_basename

    make DESTDIR=$pkgdir install

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$pkgdir/usr"

    mv lib lib32
    rm -r bin include lib32/lib share/{doc,man}
}
