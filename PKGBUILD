# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=binaryen
pkgver=46
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly, in C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/WebAssembly/binaryen"
license=('MIT')
depends=()
makedepends=('emscripten' 'cmake')
source=("https://github.com/WebAssembly/binaryen/archive/version_${pkgver}.tar.gz"
        "binaryen.sh")
sha384sums=('b39152905c3cf54e235a2170140ac55490b96b6ca15bc1ee62a44ffa4ff58a633a28d71ae299b105521742b73b16f9b9'
            '8466c1191c0e90b6cd40093ed4d1576a2f2a7f011e3e83113ebdba0f59f131ac77b5517d751fd6faa0b936113d3645d5')

prepare() {
    cd binaryen-version_${pkgver}
}

build() {
    cd binaryen-version_${pkgver}
    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    install -Dm755 $srcdir/binaryen.sh $pkgdir/etc/profile.d/binaryen.sh
    cd binaryen-version_${pkgver}/build
    make DESTDIR=${pkgdir} install
    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    if [[ -d "${pkgdir}/usr/lib64" ]]; then
        mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
    fi
}
