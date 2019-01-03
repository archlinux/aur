# Maintainer: alienzj <alienzj@gamilco>

pkgname=yaml-cpp-static
pkgver=0.6.2
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
conflicts=('yaml-cpp' 'yaml-cpp-git' 'yaml-cpp0.3' 'yaml-cpp0.5')
makedepends=('cmake')
source=(https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz)
sha512sums=('fea8ce0a20a00cbc75023d1db442edfcd32d0ac57a3c41b32ec8d56f87cc1d85d7dd7a923ce662f5d3a315f91a736d6be0d649997acd190915c1d68cc93795e4')

prepare() {
    mkdir -p yaml-cpp-yaml-cpp-$pkgver/build
}

build() {
    cd yaml-cpp-yaml-cpp-$pkgver/build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
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
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    # avoid conflicting gtest/gmock files
    rm -rf "$pkgdir"/usr/include/{gmock,gtest} "$pkgdir"/usr/lib/lib{gmock,gtest}*.so
}
