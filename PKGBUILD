# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=yaml-cpp0.5
pkgver=0.5.3
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=(https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz)
sha512sums=('fb8683e2b9847dac7e222185816637ccbec3b429abe8965169349ca9a10983692f1d78fd03c522490efd29962157cd3df25cd4f2e2fec2149d28d0df8e136dd3')

prepare() {
    mkdir -p yaml-cpp-yaml-cpp-$pkgver/build
}

build() {
    cd yaml-cpp-yaml-cpp-$pkgver/build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release
    make
}

#check() {
#    cd yaml-cpp-yaml-cpp-$pkgver/build
#    make test
#    test/run-tests
#}

package() {
    cd yaml-cpp-yaml-cpp-$pkgver

    make -C build DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    # avoid conflicting gtest/gmock files
    rm -rf "$pkgdir"/usr/include/{gmock,gtest} "$pkgdir"/usr/lib/lib{gmock,gtest}*.so

    # Remove unversioned library and development files.
    rm -rf "$pkgdir"/usr/lib/libyaml-cpp.so
    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/lib/pkgconfig/yaml-cpp.pc
}
