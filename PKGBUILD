# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=foldseek
_tag=10-941cd33
pkgver=10_941cd33
pkgrel=2
pkgdesc="Fast and sensitive comparison of large protein structure sets"
arch=('x86_64')
url="https://github.com/steineggerlab/foldseek"
license=('GPL-3.0-or-later')
depends=('zlib' 'gcc-libs')
makedepends=('cmake' 'rust')
conflicts=('foldseek-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_tag}.tar.gz")
sha256sums=('0db8bf072c9ec895efc6aa3626c746f4ca020acc9b92e9b2292b56c8c9f8a943')

# foldseek vendors mmseqs2 plus a Rust block-aligner crate built through
# corrosion (offline, from the tarball), so a Rust toolchain is needed at
# build time. HAVE_SSE4_1 picks the portable SSE4.1 paths for both the C++
# and the Rust side (simd_sse2 feature) instead of upstream's default
# NATIVE_ARCH, which would bake the build machine's CPU capabilities into
# the binary; ProstT5/ggml follow the same selection automatically.

prepare() {
  cd "$srcdir/$pkgname-${_tag}"
  # cmake 4: drop CMP0060 OLD (upstream only needs it for static builds) and
  # raise the pre-3.5 cmake_minimum_required calls cmake 4 refuses to load
  sed -i '/cmake_policy(SET CMP0060 OLD)/d' CMakeLists.txt
  sed -i 's/cmake_minimum_required(VERSION 2\.8\.12 FATAL_ERROR)/cmake_minimum_required(VERSION 3.15 FATAL_ERROR)/' lib/mmseqs/CMakeLists.txt
  sed -i 's/cmake_minimum_required(VERSION 2\.8\.12)/cmake_minimum_required(VERSION 3.15)/' lib/mmseqs/lib/tinyexpr/CMakeLists.txt
  sed -i 's/cmake_minimum_required(VERSION 3\.0 FATAL_ERROR)/cmake_minimum_required(VERSION 3.15 FATAL_ERROR)/' lib/foldcomp/CMakeLists.txt
}

build() {
  cd "$srcdir/$pkgname-${_tag}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DHAVE_SSE4_1=1
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-${_tag}"
  install -Dm755 build/src/foldseek "$pkgdir/usr/bin/foldseek"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
