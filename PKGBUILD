# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=polly
pkgver=11.0.0
pkgrel=1
pkgdesc="High-level loop and data-locality optimizer and optimization infrastructure for LLVM"
arch=('x86_64')
url="https://polly.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$pkgname-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        support-linking-ScopPassManager-against-LLVM-dylib.patch)
sha256sums=('dcfadb8d11f2ea0743a3f19bab3b43ee1cb855e136bc81c76e2353cd76148440'
            'SKIP'
            '913f68c898dfb4a03b397c5e11c6a2f39d0f22ed7665c9cefa87a34423a72469'
            'SKIP'
            'ce3c528eabef1ef3a4c3ca69a527b98b4f2e924069f24e68ced5462c95263ba6')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/$pkgname-$pkgver.src"
  mkdir build

  # https://reviews.llvm.org/D85281
  patch -Np2 -i ../support-linking-ScopPassManager-against-LLVM-dylib.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver.src/build"

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
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/$pkgname/html/{_sources,.buildinfo}
}

# vim:set ts=2 sw=2 et:
