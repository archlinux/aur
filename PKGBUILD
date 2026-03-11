# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=polly
pkgver=22.1.1
pkgrel=1
pkgdesc="High-level loop and data-locality optimizer and optimization infrastructure for LLVM"
arch=('x86_64')
url="https://polly.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libstdc++' 'glibc')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})
sha256sums=('9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85'  # Cullen Rhodes <cullen.rhodes@arm.com>
)

prepare() {
  cd llvm-project-$pkgver.src/polly
  mkdir build
}

build() {
  cd llvm-project-$pkgver.src/polly/build

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
    -DLLVM_BUILD_MAIN_SRC_DIR="$srcdir/llvm-project-$pkgver.src/llvm"
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd llvm-project-$pkgver.src/polly/build
  ninja check-polly
}

package() {
  cd llvm-project-$pkgver.src/polly/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 "$srcdir/llvm-project-$pkgver.src/polly/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/polly/html/{_sources,.buildinfo}
}

# vim:set ts=2 sw=2 et:
