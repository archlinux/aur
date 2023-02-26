# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm13' 'llvm13-libs')
pkgver=13.0.1
pkgrel=3
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'python')
options=('staticlibs' '!lto') # Getting thousands of test failures with LTO
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        don-t-accept-nullptr-as-GEP-element-type.patch
        don-t-override-__attribute__-no_stack_protector.patch
        don-t-move-DBG_VALUE-instructions.patch
        disable-A-B-A-B-and-BSWAP-in-InstCombine.patch
        disable-DIArgList-in-SPIR-V.patch)
sha256sums=('ec6b80d82c384acad2dc192903a6cf2cdbaffb889b84bfb98da9d71e630fc834'
            'SKIP'
            'a7e902a7612d0fdabe436a917468b043cc296bc89d8954bfc3126f737beb9ac4'
            '9f0a4578b94eb8853b83af2f65e92705254b4b56d96f9a941714d174b932f465'
            'f7d69f84241416398fdb3df8bb44f9fae3c49d89889c7ffa3b37aa2e9d78f708'
            '34cc0d79a30599cb2287b47b4e9a1a5bf03d57a1f8bb35be3fe976ffc4a604f6'
            '8642da2d556092e4284873ba6ddc6c9a67841f42cc16f923bcd523e4b304a3ff')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd llvm-$pkgver.src
  mkdir build

  # https://github.com/intel/intel-graphics-compiler/issues/204
  patch -Rp2 -i ../don-t-accept-nullptr-as-GEP-element-type.patch

  # Fixes Chromium error "*** stack smashing detected ***: terminated"
  # (which also goes away with "--change-stack-guard-on-fork=disabled")
  # https://reviews.llvm.org/D116589
  patch -Np2 -i ../don-t-override-__attribute__-no_stack_protector.patch

  # https://github.com/llvm/llvm-project/issues/53243
  # https://github.com/rust-lang/rust/issues/92869
  patch -Np2 -i ../don-t-move-DBG_VALUE-instructions.patch

  # Patches needed for ISPC for Xe only
  patch -Np2 -i ../disable-A-B-A-B-and-BSWAP-in-InstCombine.patch
  patch -Np2 -i ../disable-DIArgList-in-SPIR-V.patch
}

build() {
  cd llvm-$pkgver.src/build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm13
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_BINUTILS_INCDIR=/usr/include
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_HOST_TRIPLE=$CHOST
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd llvm-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check
}

package_llvm13() {
  pkgdesc="Compiler infrastructure (LLVM 13)"
  depends=('llvm13-libs' 'perl')

  cd llvm-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install

  # The runtime libraries go into llvm13-libs
  mv -f "$pkgdir"/usr/lib/llvm13/lib/libLLVM-{13,$pkgver}.so "$srcdir/"
  mv -f "$pkgdir"/usr/lib/llvm13/lib/LLVMgold.so "$srcdir/"

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm13-libs() {
  pkgdesc="LLVM 13 runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/usr/lib/llvm13/lib"
  cp -P "$srcdir"/libLLVM-{13,$pkgver}.so "$pkgdir/usr/lib/"
  ln -s ../../libLLVM-13.so "$pkgdir/usr/lib/llvm13/lib/libLLVM-13.so"
  ln -s ../../libLLVM-13.so "$pkgdir/usr/lib/llvm13/lib/libLLVM-$pkgver.so"
  cp -P "$srcdir"/LLVMgold.so "$pkgdir/usr/lib/llvm13/lib/"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
