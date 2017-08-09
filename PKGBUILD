# Maintainer: Kris McCleary <kris27mc@gmail.com>

_pkgname=libprotobuf
pkgname=lib32-$_pkgname-git
pkgver=v3.3.1.r256.g35db2675
pkgrel=1
pkgdesc="A language-neutral, platform-neutral extensible mechanism for serializing structured data."
url="https://developers.google.com/protocol-buffers/"
license=('custom')
arch=('x86_64')
depends=('')
makedepends=('gcc-multilib' 'curl' 'unzip')
source=("git+https://github.com/google/protobuf.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/protobuf"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/protobuf"

    ./autogen.sh
    #autoreconf -i
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --build=i386-pc-linux-gnu CFLAGS="-m32 -DNDEBUG" CXXFLAGS="-m32 -DNDEBUG" LDFLAGS=-m32 --prefix=/usr --libdir=/usr/lib32
    make -j4
}

package() {
    cd "${srcdir}/protobuf"

    make DESTDIR="$pkgdir" install
    rm "$pkgdir/usr/bin/protoc"
    rm "$pkgdir/usr/lib32/libprotoc.so.13"
    rm -r "$pkgdir/usr/include"
}