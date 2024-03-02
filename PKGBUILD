# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=compiler-rt16
pkgver=16.0.6
pkgrel=1
pkgdesc="Compiler runtime libraries for clang 16"
arch=('x86_64')
url="https://compiler-rt.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm16' 'cmake' 'ninja' 'python')
# Build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('lib32-gcc-libs')
options=('staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/compiler-rt-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $pkgname-move-allocator-base.patch::https://github.com/llvm/llvm-project/commit/fb77ca05ffb4.patch)
sha256sums=('7911a2a9cca10393a17f637c01a6f5555b0a38f64ff47dc9168413a4190bc2db'
            'SKIP'
            '39d342a4161095d2f28fb1253e4585978ac50521117da666e2b1f6f28b62f514'
            'SKIP'
            '18d48240a6ef1242494fda7901858e189fb1c16791a33de0e862f519665eb1e3')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  mv cmake{-$pkgver.src,}
  cd compiler-rt-$pkgver.src
  mkdir build

  # ASan: move allocator base to avoid conflict with high-entropy ASLR for x86-64 Linux
  patch -Np2 -i ../$pkgname-move-allocator-base.patch
}

build() {
  cd compiler-rt-$pkgver.src/build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm16
    -DCMAKE_SKIP_RPATH=ON
    -DCOMPILER_RT_INSTALL_PATH=/usr/lib/llvm16/lib/clang/${pkgver%%.*}
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

package() {
  cd compiler-rt-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
