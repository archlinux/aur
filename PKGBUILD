# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org=joaoleal
_pkgname=CppADCodeGen
pkgname=cppadcodegen
pkgver=2.5.0
pkgrel=2
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
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz" "90.patch" "93.patch" "95.patch")
sha256sums=('a53d3e91cfa17381f31819d549de71767b90d05e671fa848043694b0f53d6c18'
            '709b811403825959a9d17e52f2132c31b92e1cd34ed653b0fd6ffa384291c1d0'
            'f766cd866294335326014ea023483a61c5668d3f2dadaeedd069ffae1aad8e3a'
            'e682d1d9320fb1988ac3c041d4c89c01d6da04310baf8ff7165353cc64c6d753')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i "$srcdir/90.patch"
  patch -p1 -i "$srcdir/93.patch"
  patch -p1 -i "$srcdir/95.patch"
}

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
