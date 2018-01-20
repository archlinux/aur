# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=binaryen
pkgver=42
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly, in C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/WebAssembly/binaryen"
license=('MIT')
depends=()
makedepends=('emscripten' 'cmake')
source=("https://github.com/WebAssembly/binaryen/archive/version_${pkgver}.tar.gz"
        "binaryen.sh")
sha384sums=('abb342fd7aa9524f0ba522b1f550c0266415183bdc16f8b5d5a5943cb81863804e3184beef2c150816fc262128dc364c'
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
