# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=GSL
pkgname=microsoft-gsl
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ Core Guidelines Support Library"
arch=('any')
url="https://github.com/Microsoft/GSL"
license=('MIT')
makedepends=('cmake' 'catch2')
source=("https://github.com/Microsoft/GSL/archive/v${pkgver}.tar.gz"
        "gcc_unsigned_error.patch"
        "use_system_catch2.patch")
sha256sums=('9694b04cd78e5b1a769868f19fdd9eea2002de3d4c3a81a1b769209364543c36'
            'c558af38ad46d26b65f0d4d7091fd0b034ffde860b5c5546cda7c43942d93b4b'
            '984e53dbccf938725519be8fd0b46c67f6f60d2d573a6b0ab82fbe94fce3f43c')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i "$srcdir/gcc_unsigned_error.patch"
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
