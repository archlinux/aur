# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=GSL
pkgname=microsoft-gsl
pkgver=2.0.0
pkgrel=1
pkgdesc="C++ Core Guidelines Support Library"
arch=('any')
url="https://github.com/Microsoft/GSL"
license=('MIT')
makedepends=('cmake' 'catch2')
source=("https://github.com/Microsoft/GSL/archive/v${pkgver}.tar.gz"
        "use_system_catch2.patch")
sha256sums=('6cce6fb16b651e62711a4f58e484931013c33979b795d1b1f7646f640cfa9c8e'
            '9ebdc1b3628bbdce82e3be469c183cd0d94d3d8964189aad71dac5d7e94d9f58')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i "$srcdir/use_system_catch2.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \

    cmake --build build
}

check() {
    cd "$_pkgname-$pkgver"
    cmake --build build -- test
}

package() {
    cd "$_pkgname-$pkgver"
    cmake --build build -- DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
