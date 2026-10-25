# Maintainer: Roland Leißa <roland.leissa@uni-goettingen.de>

pkgname=mim
_pkgname=mimir
pkgver=0.4
pkgrel=1
pkgdesc='MimIR: a higher-order, dependently typed intermediate representation with plugins'
arch=('x86_64')
url='https://mimir.github.io/'
license=('MIT')
depends=('gcc-libs' 'glibc' 'python' 'unordered_dense')
makedepends=('cmake' 'ninja' 'clang')
optdepends=('clang: compile emitted LLVM IR and JIT regex matchers from Python')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('978dcf1fe57da8a1970b7ff95ee12dfe548d208ca87743c510b63ecd6efc1d65')

build() {
  # Log messages embed std::source_location paths.
  CXXFLAGS+=" -ffile-prefix-map=$srcdir/="
  cmake -S "$_pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DFE_USE_SYSTEM_UNORDERED_DENSE=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname-$pkgver/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
