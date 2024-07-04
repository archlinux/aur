# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=polly
pkgver=18.1.8
pkgrel=1
pkgdesc="High-level loop and data-locality optimizer and optimization infrastructure for LLVM"
arch=('x86_64')
url="https://polly.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('gcc-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/polly-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('0366962199fa353ba1ed22f3ea61f337d682e8da75ba56fbbd4f7a49e2bc5127'
            'SKIP'
            'f68cf90f369bc7d0158ba70d860b0cb34dbc163d6ff0ebc6cfa5e515b9b2e28d'
            'SKIP'
            '59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  mv cmake{-$pkgver.src,}
  cd polly-$pkgver.src
  mkdir build
}

build() {
  cd polly-$pkgver.src/build

  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_INSTALL_PREFIX=/usr
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
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
