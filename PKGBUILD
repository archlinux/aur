# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=polly
pkgver=13.0.1
pkgrel=1
pkgdesc="High-level loop and data-locality optimizer and optimization infrastructure for LLVM"
arch=('x86_64')
url="https://polly.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$pkgname-$pkgver.src.tar.xz{,.sig}
        add-missing-loadPolly.patch
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig})
sha256sums=('f4003e03da57b53bf206faadd0cf53f7b198c38498c605dec45743db23c10ad0'
            'SKIP'
            'be0866a1c7d2677f6ba7625413dcd5bd7e47e86097b5c19f2057b50e6ed57eb0'
            'ec6b80d82c384acad2dc192903a6cf2cdbaffb889b84bfb98da9d71e630fc834'
            'SKIP')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/$pkgname-$pkgver.src"
  mkdir build

  patch -Np2 -i ../add-missing-loadPolly.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver.src/build"

  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_BUILD_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  ninja
}

check() {
  cd "$srcdir/$pkgname-$pkgver.src/build"
  ninja check-polly
}

package() {
  cd "$srcdir/$pkgname-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/$pkgname/html/{_sources,.buildinfo}
}

# vim:set ts=2 sw=2 et:
