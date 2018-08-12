# $Id$
# Maintainer: Aaron van Geffen <aaron@aaronweb.net>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=lib32-yaml-cpp
pkgver=0.6.2
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('lib32-gcc-libs')
makedepends=('cmake')
source=(https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz)
sha512sums=('fea8ce0a20a00cbc75023d1db442edfcd32d0ac57a3c41b32ec8d56f87cc1d85d7dd7a923ce662f5d3a315f91a736d6be0d649997acd190915c1d68cc93795e4')

prepare() {
    mkdir -p yaml-cpp-yaml-cpp-$pkgver/build
}

build() {
    cd yaml-cpp-yaml-cpp-$pkgver/build

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_SUFFIX=32 \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release
    make
}

check() {
    cd yaml-cpp-yaml-cpp-$pkgver/build
    make test
    test/run-tests
}

package() {
    cd yaml-cpp-yaml-cpp-$pkgver

    make -C build DESTDIR="$pkgdir" install
	rm -rf "$pkgdir"/usr/{include,lib,share}

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
