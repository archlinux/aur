# Maintainer: Roland Leißa <roland.leissa@uni-goettingen.de>

pkgname=mim
_pkgname=mimir
pkgver=0.5
pkgrel=1
_commit=542855790e
pkgdesc='MimIR: a higher-order, dependently typed intermediate representation with plugins'
arch=('x86_64')
url='https://mimir.github.io/'
license=('MIT')
depends=('gcc-libs' 'glibc' 'python' 'unordered_dense')
makedepends=('cmake' 'ninja' 'clang')
optdepends=('clang: compile emitted LLVM IR and JIT regex matchers from Python')
source=("https://github.com/mimir/mimir/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('c06df5625390990fa70c4fa5a615b2a252b3ab34a844f37aed814cfa46232e96')

build() {
  # Log messages embed std::source_location paths.
  CXXFLAGS+=" -ffile-prefix-map=$srcdir/="
  cmake -S "$_pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DFE_USE_SYSTEM_UNORDERED_DENSE=ON \
    -DMIM_GIT_HASH=$_commit \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname-$pkgver/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
