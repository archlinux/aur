# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>
# Contributor: Lancelot Owczarczak <lancelot@owczarczak.fr>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=compiler-rt17
pkgver=17.0.6
pkgrel=2
pkgdesc="Compiler runtime libraries for clang 17"
arch=('x86_64')
url="https://compiler-rt.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm17' 'cmake' 'ninja' 'python')
# Build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('lib32-gcc-libs')
options=('staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/compiler-rt-$pkgver.src.tar.xz
        $_source_base/cmake-$pkgver.src.tar.xz
        https://github.com/llvm/llvm-project/commit/59978b21ad9c65276ee8e14f26759691b8a65763.patch)
sha256sums=('11b8d09dcf92a0f91c5c82defb5ad9ff4acf5cf073a80c317204baa922d136b4'
            '807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4'
            'ccb40c999aecdf32875b8800e5a87db2e899aede2eeec13228fcb6a76db83274')

prepare() {
  mv cmake{-$pkgver.src,}
  cd compiler-rt-$pkgver.src
  mkdir build

  # https://github.com/llvm/llvm-project/commit/59978b21ad9c65276ee8e14f26759691b8a65763
  patch -Nsp2 -i "$srcdir"/59978b21ad9c65276ee8e14f26759691b8a65763.patch

  # https://gcc.gnu.org/gcc-15/porting_to.html#header-dep-changes
  sed -i '18i #include <cstdint>' lib/orc/error.h
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
