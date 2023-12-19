# Maintainer: Lancelot Owczarczak <lancelot@owczarczak.fr>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=compiler-rt17
pkgver=17.0.6
pkgrel=1
pkgdesc="Compiler runtime libraries for clang 17"
arch=('x86_64')
url="https://compiler-rt.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python')
# Build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('lib32-gcc-libs')
options=('staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/compiler-rt-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('11b8d09dcf92a0f91c5c82defb5ad9ff4acf5cf073a80c317204baa922d136b4'
            'SKIP'
            '807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  mv cmake{-$pkgver.src,}
  cd compiler-rt-$pkgver.src
  mkdir build
}

build() {
  cd compiler-rt-$pkgver.src/build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm17
    -DCMAKE_SKIP_RPATH=ON
    -DCOMPILER_RT_INSTALL_PATH=/usr/lib/llvm17/lib/clang/${pkgver%%.*}
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
