# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org=joaoleal
_pkgname=CppADCodeGen
pkgname=cppadcodegen
pkgver=2.5.0
pkgrel=1
pkgdesc="Source Code Generation for Automatic Differentiation using Operator Overloading"
arch=('any')
url="https://github.com/$_org/$_pkgname"
license=('GPL-3.0-only')
depends=('cppad')
optdepends=('eigen: required when DAE differentiation index reduction is used',
            'valgrind: memcheck test'
            'clang: only required for JIT compilation'
            'llvm: only required for JIT compilation')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a53d3e91cfa17381f31819d549de71767b90d05e671fa848043694b0f53d6c18')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    install -Dm644 "$_pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
