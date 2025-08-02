# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

pkgname=lib32-sbc
pkgver=2.0
pkgrel=2
pkgdesc="Bluetooth Subband Codec (SBC) library (32-bit)"
url="https://git.kernel.org/pub/scm/bluetooth/sbc.git"
arch=(x86_64)
license=(GPL LGPL)
depends=(lib32-glibc sbc)
makedepends=(git lib32-gcc-libs)
_commit=8dc5d5ba381512ad5b1afa45c63ec6b0a3833244 # tags/2.0^0
source=("git+$url#commit=$_commit")
b2sums=('c4b37f680dbae34bd39fe9b5db9a8240d982f77bb83b961f6dbd504c55f861c43dcf6a84b29a5622aacaf3e29fa0086fbb67e64b1ba2868bd6b9297f64f0154b')

pkgver() {
    cd sbc

    git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd sbc

    autoreconf -fvi
}

build() {
    cd sbc

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure --prefix=/usr \
        --build=i686-pc-linux-gnu \
        --libdir=/usr/lib32 \
        --disable-static \
        --disable-tester

    make
}

check() {
    cd sbc

    make check
}

package() {
    cd sbc

    make DESTDIR="$pkgdir" install

    cd "$pkgdir"/usr

    rm -r bin include
}
