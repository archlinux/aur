# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=binaryen
pkgver=22
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly, in C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/WebAssembly/binaryen"
license=('MIT')
depends=('libc++')
makedepends=('emscripten' 'cmake' 'clang')
source=("https://github.com/WebAssembly/binaryen/archive/version_${pkgver}.tar.gz"
        "binaryen.sh")
sha256sums=('17981aa2e07a6dbecf27b430898d89ab1edfa46bcd22b9cf5a55426bc44b7bde'
            '2262d9450ee2558e48dfc056627cabe4a1760d9e6cfad9b091f485efca68607a')

build() {
    cd binaryen-version_${pkgver}
    rm -rf build
    mkdir build
    cd build
    export CC=clang
    export CXX='clang -stdlib=libc++'
    export LDFLAGS='-stdlib=libc++ -lc++abi'
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    install -Dm755 $srcdir/binaryen.sh $pkgdir/etc/profile.d/binaryen.sh
    cd binaryen-version_${pkgver}/build
    make DESTDIR=${pkgdir} install
    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
