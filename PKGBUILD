# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libsedml
_pkgname=libSEDML
pkgver=2.0.34
pkgrel=1
pkgdesc="Simulation Experiment Description - Markup Language"
url=https://github.com/fbergmann/libSEDML
license=('BSD-2-Clause')
arch=('x86_64')
depends=('libnuml' 'libsbml' 'libgcc' 'libstdc++' 'zlib')
makedepends=('cmake')
source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('e2214b6fcf6360391c383f58c4198877819c45a483fe1eb4ab1cfa2e0c3fcac1')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i "s/LANGUAGES CXX/LANGUAGES C CXX/" CMakeLists.txt
}

build() {
  cmake -S "$_pkgname-$pkgver" -B build \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DLIBNUML_SHARED=ON \
    -DLIBSBML_SHARED=ON \
    -DWITH_SWIG=OFF \
    -DWITH_ZLIB=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
