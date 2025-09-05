# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='jrl-umi3218'
_pkgname=jrl-cmakemodules
pkgname=$_pkgname
pkgver=1.0.0
pkgrel=2
pkgdesc="CMake utility toolbox"
arch=('any')
url="https://github.com/$_org/$_pkgname"
license=('LGPL-3.0-or-later')
makedepends=('cmake')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" 776.patch)
sha256sums=('a54c7adab9e236952e15fe45c7e2d3f27419c19afa9d80232ea555badca337cf'
            'd4a29310f63f9323a33868839353c4248aaa9c3ae24e37a2b488ed181b211608')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i "$srcdir/776.patch"
}

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
