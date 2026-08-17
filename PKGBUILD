# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=foldseek
_tag=10-941cd33
pkgver=10_941cd33
pkgrel=1
pkgdesc="Fast and sensitive comparison of large protein structure sets"
arch=('x86_64')
url="https://github.com/steineggerlab/foldseek"
license=('GPL3')
depends=('zlib' 'gcc-libs')
makedepends=('cmake' 'rust')
provides=('foldseek')
conflicts=('foldseek-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_tag}.tar.gz")
sha256sums=('0db8bf072c9ec895efc6aa3626c746f4ca020acc9b92e9b2292b56c8c9f8a943')

# foldseek vendors mmseqs2 plus a Rust block-aligner crate built through
# corrosion (offline, from the tarball), so a Rust toolchain is needed at
# build time. HAVE_SSE4_1 picks the portable SSE4.1 paths for both the C++
# and the Rust side (simd_sse2 feature) instead of upstream's default
# NATIVE_ARCH, which would bake the build machine's CPU capabilities into
# the binary; ProstT5/ggml follow the same selection automatically.

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DHAVE_SSE4_1=1
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/src/foldseek "$pkgdir/usr/bin/foldseek"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
