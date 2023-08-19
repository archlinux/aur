# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=compiler-rt15
pkgver=15.0.7
pkgrel=1
pkgdesc="Compiler runtime libraries for clang 15"
arch=('x86_64')
url="https://compiler-rt.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm15' 'cmake' 'ninja' 'python')
# Build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('lib32-gcc-libs')
options=('staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/compiler-rt-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('353832c66cce60931ea0413b3c071faad59eefa70d02c97daa8978b15e4b25b7'
            'SKIP'
            '8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

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
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm15
    -DCMAKE_SKIP_RPATH=ON
    -DCOMPILER_RT_INSTALL_PATH=/usr/lib/llvm15/lib/clang/$pkgver
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
