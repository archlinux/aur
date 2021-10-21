# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libaec
pkgname=lib32-libaec
pkgver=1.0.6
pkgrel=1
pkgdesc="Adaptive Entropy Coding library (32-bit)"
arch=(x86_64)
url="https://gitlab.dkrz.de/k202009/libaec"
license=(custom)
depends=(lib32-glibc libaec)
makedepends=(cmake)
_md5=ea0b7d197a950b0c110da8dfdecbb71f
source=(${url}/-/archive/v${pkgver}/${_basename}-v${pkgver}.tar.bz2)
sha256sums=('31fb65b31e835e1a0f3b682d64920957b6e4407ee5bbf42ca49549438795a288')

prepare() {
    mkdir -p build
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake -B build -S ${_basename}-v${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install

    install -Dm644 ${_basename}-v${pkgver}/LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/

    mv "${pkgdir}"/usr/{,lib32}/cmake

    cd "$pkgdir/usr"

    rm -r bin include share/man
}
