# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=binaryen
pkgver=61
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly, in C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/WebAssembly/binaryen"
license=('MIT')
depends=()
makedepends=('emscripten' 'cmake')
source=("https://github.com/WebAssembly/binaryen/archive/version_${pkgver}.tar.gz"
        "binaryen.sh")
sha384sums=('a58101acf14d50b6c3e134e9d75fd22e0e8a28a4ebe159816145ae818926708c99b212d0148b42747bc01f67fd3ba086'
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
