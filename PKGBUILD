# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=chromaprint
pkgname="lib32-$_basename"
pkgver=1.5.0
pkgrel=1
pkgdesc='Library that implements a custom algorithm for extracting fingerprints from any audio source (32-bit)'
url='https://acoustid.org/chromaprint'
arch=('x86_64')
license=('LGPL')
depends=('lib32-ffmpeg' 'chromaprint')
makedepends=('cmake')
source=("https://github.com/acoustid/chromaprint/releases/download/v${pkgver}/chromaprint-${pkgver}.tar.gz"
        "fix_build_32bit.patch")
sha256sums=('573a5400e635b3823fc2394cfa7a217fbb46e8e50ecebd4a61991451a8af766a'
            'ae0e2805c4fa19ab5e51c4ec8e414c548eb0d66511ee45d41ca8c99a1ca32db5')

prepare() {
    mkdir build

    cd ${_basename}-v${pkgver}

    patch -Np1 -i ../fix_build_32bit.patch
}

build() {
    cd build

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake "../$_basename-v$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd build

    make DESTDIR="$pkgdir" install

    cd "$pkgdir"/usr

    sed -e "s|/usr/lib|/usr/lib32|" -i lib/pkgconfig/libchromaprint.pc

    rm -r include
    mv lib lib32
}
