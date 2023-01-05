# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=polly
pkgver=15.0.6
pkgrel=1
pkgdesc="High-level loop and data-locality optimizer and optimization infrastructure for LLVM"
arch=('x86_64')
url="https://polly.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/polly-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('481e8ee1438917a337d58ff879b8e8a5e3c031e35fa93af6cfdc0b5857c28d92'
            'SKIP'
            '0b32199401f27e2e0353846a8c5fbadd77beca2570654fb9ef7ac9b7f26967e3'
            'SKIP'
            '7613aeeaba9b8b12b35224044bc349b5fa45525919625057fa54dc882dcb4c86'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  mv cmake{-$pkgver.src,}
  cd polly-$pkgver.src
  mkdir build
}

build() {
  cd polly-$pkgver.src/build

  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_INSTALL_PREFIX=/usr
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd polly-$pkgver.src/build
  ninja check-polly
}

package() {
  cd polly-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/polly/html/{_sources,.buildinfo}
}

# vim:set ts=2 sw=2 et:
