# Maintainer: Dario Ostuni <another.code.996@gmail.com>

_pkgname=yaml-cpp
pkgname=mingw-w64-${_pkgname}
pkgver=0.6.3
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec (mingw-w64)"
url="https://github.com/jbeder/yaml-cpp"
arch=('any')
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc')
source=("https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz")
options=(staticlibs !strip !buildflags)
sha384sums=('26dbb461a02eaf1826c5a033b7cf92d8ac59d4e90e84008588dba1fda0cc03ed61a8c63800ddeaf9d8072118d3a23846')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd $srcdir/${_pkgname}-${_pkgname}-$pkgver
    unset LDFLAGS
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake .. -DCMAKE_INSTALL_PREFIX=/usr/${_arch} -DBUILD_SHARED_LIBS=OFF -DYAML_CPP_BUILD_TOOLS=OFF -DYAML_CPP_BUILD_TESTS=OFF
        make
        ${_arch}-cmake .. -DCMAKE_INSTALL_PREFIX=/usr/${_arch} -DBUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TOOLS=OFF -DYAML_CPP_BUILD_TESTS=OFF
        make
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "$srcdir/${_pkgname}-${_pkgname}-$pkgver/build-${_arch}"
        make DESTDIR=$pkgdir install
        install -Dm644 libyaml-cpp.a $pkgdir/usr/${_arch}/lib/libyaml-cpp.a
        install -Dm644 yaml-cpp-config.cmake $pkgdir/usr/${_arch}/lib/cmake/${_pkgname}/yaml-cpp-config.cmake
        install -Dm644 yaml-cpp-config-version.cmake $pkgdir/usr/${_arch}/lib/cmake/${_pkgname}/yaml-cpp-config-version.cmake
        install -Dm644 yaml-cpp-targets.cmake $pkgdir/usr/${_arch}/lib/cmake/${_pkgname}/yaml-cpp-targets.cmake
        find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
        find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
        find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    done
}
