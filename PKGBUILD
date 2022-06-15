# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=securefs
pkgver=0.13.0
pkgrel=2
pkgdesc="A better transparent encryption filesystem"
arch=('i686' 'x86_64')
url=https://github.com/netheril96/securefs
license=('MIT')
depends=('fuse' 'clang')
makedepends=('cmake' 'git' 'python')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule init && git submodule update
}

build() {
    cd "$pkgname"
    mkdir -p build && cd build
    CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=/usr -Dlibdir=/usr/lib ..

    # fix regression in 0.13.0
    sed -i 's/"-march=x86-64 -mtune=generic -O2 -pipe -fno-plt.*"//' external/cryptopp/CMakeFiles/{cryptest.dir/*.make,cryptopp-static.dir/*.make,cryptopp-object.dir/*.make}

    make
    # ctest
}

package() {
    cd "$pkgname"
    install -Dm755 build/securefs "$pkgdir"/usr/bin/securefs
    install -Dm755 build/securefs_test "$pkgdir"/usr/bin/securefs_test
    install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
}
