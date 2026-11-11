# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=kokkos
pkgname=kokkos-cuda
pkgver=5.2.2
pkgrel=1
pkgdesc="C++ performance portability programming ecosystem (with CUDA)"
arch=('x86_64')
url="https://github.com/$_name/$_name"
license=('Apache-2.0 WITH LLVM-exception')
depends=('bash'
         'glibc'
         'libgcc'
         'libstdc++'
         'hwloc'
         'cuda')
makedepends=('cmake')
provides=("kokkos=$pkgver")
conflicts=('kokkos')
options=('!lto')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('491fe02cb127559dd3c996f6693686f1eab00a53fd5c184e18e663896884175e')

prepare() {
  cd "$_name-$pkgver"
  # Pass -Wp, options (from Arch's CXXFLAGS) to the host compiler without splitting them at their commas
  sed -i 's/^  -Wa,\*)$/  -Wa,*|-Wp,*)/' bin/nvcc_wrapper
}

build() {
  cd "$_name-$pkgver"
  export PATH="/opt/cuda/bin:$PATH"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DCMAKE_CXX_COMPILER="$PWD"/bin/nvcc_wrapper -DBUILD_SHARED_LIBS=ON -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=ON -DKokkos_ENABLE_CUDA=ON -DKokkos_ENABLE_CUDA_CONSTEXPR=ON -DKokkos_ARCH_TURING75=ON -DKokkos_ENABLE_HWLOC=ON -DKokkos_ENABLE_LIBDL=ON -Wno-dev
  cmake --build build
}

package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
