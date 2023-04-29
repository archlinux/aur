# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Markus Martin <markus@archwyrm.net>
# Contributor: Asuka Minato

pkgname=yaml-cpp0.6
pkgver=0.6.3
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' glibc)
makedepends=('cmake')
provides=('libyaml-cpp.so.0.6')
source=(https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz)
sha512sums=('68b9ce987cabc1dec79382f922de20cc2c222cb9c090ecb93dc686b048da5c917facf4fce6d8f72feea44b61e5a6770ed3b0c199c4cd4e6bde5b6245c09f8e49')

prepare() {
    mkdir -p yaml-cpp-yaml-cpp-$pkgver/build
}

build() {
    cd yaml-cpp-yaml-cpp-$pkgver/build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DYAML_BUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release
    # DYAML fix based on old readme
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
    mv "$pkgdir"/usr/lib/libyaml-cpp.so "$pkgdir"/usr/lib/libyaml-cpp.so.0.6
    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/lib/pkgconfig/yaml-cpp.pc
}
