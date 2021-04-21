#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('lib32-llvm-rc' 'lib32-llvm-libs-rc' 'lib32-clang-rc')
url='https://llvm.org/'
pkgver=12.0.0rc5
versiontag=12.0.0-rc5
pkgrel=1
arch=('i686' 'x86_64')
url='https://llvm.org/'
makedepends=('cmake' 'ninja' 'lib32-libffi' 'lib32-zlib' 'python' 'gcc-multilib' 'lib32-libxml2')
options=('staticlibs')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd llvm-project-$pkgver.src/llvm

  #rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLLVM_LIBDIR_SUFFIX=32 \
  -DCMAKE_C_FLAGS:STRING=-m32 \
  -DCMAKE_CXX_FLAGS:STRING=-m32 \
  -DLLVM_TARGET_ARCH:STRING=i686 \
  -DLLVM_HOST_TRIPLE=$CHOST \
  -DLLVM_DEFAULT_TARGETS_TRIPLE="i686-pc-linux-gnu" \
  -DLLVM_BUILD_LLVM_DYLIB=ON \
  -DLLVM_LINK_LLVM_DYLIB=ON \
  -DLLVM_ENABLE_RTTI=ON \
  -DLLVM_ENABLE_FFI=ON \
  -DLLVM_BUILD_DOCS=OFF \
  -DLLVM_ENABLE_SPHINX=OFF \
  -DLLVM_ENABLE_DOXYGEN=OFF \
  -DLLVM_BINUTILS_INCDIR=/usr/include \
  -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"

  ninja -j12 -C build all
  ninja -C build ocaml_doc
}

package_lib32-llvm-rc(){
  pkgdesc='Collection of modular and reusable compiler and toolchain technologies (32-bit) (rc release)'
  depends=('lib32-llvm-libs' 'llvm')
  conflicts=('lib32-llvm' 'lib32-llvm-git' 'lib32-llvm-stable')
  provides=('lib32-llvm')

  cd llvm-project-$pkgver.src/llvm/build

  DESTDIR="$pkgdir" ninja install

  # The runtime library goes into lib32-llvm-libs
  mv "$pkgdir"/usr/lib32/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/usr/lib32/LLVMgold.so "$srcdir"

  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/lib32/*.a

  mv "$pkgdir/usr/bin/llvm-config" "$pkgdir/usr/lib32/llvm-config"
  mv "$pkgdir/usr/include/llvm/Config/llvm-config.h" "$pkgdir/usr/lib32/llvm-config-32.h"

  rm -rf "$pkgdir"/usr/{bin,include,libexec,share/{doc,man,llvm,opt-viewer,clang,scan-build,scan-view}}

  # Needed for multilib (https://bugs.archlinux.org/task/29951)
  # Header stub is taken from Fedora
  install -d "$pkgdir/usr/include/llvm/Config"
  mv "$pkgdir/usr/lib32/llvm-config-32.h" "$pkgdir/usr/include/llvm/Config/"

  mkdir "$pkgdir"/usr/bin
  mv "$pkgdir/usr/lib32/llvm-config" "$pkgdir/usr/bin/llvm-config32"

  install -Dm644 "$srcdir/llvm-project-$pkgver.src/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf "$pkgdir"/usr/lib

  # move everything provided by clang to a separate package

  rm -rf "$srcdir"/clang.{lib32,cmake,lib32.clang}

  # move clang lib to a separate package
  mkdir "$srcdir/clang.lib32"
  mv "$pkgdir"/usr/lib32/*libclang* "$srcdir/clang.lib32"

  # move lib32/cmake/mlir to a separate package
  mkdir "$srcdir/clang.cmake"
  mv "$pkgdir"/usr/lib32/cmake/clang  "$srcdir/clang.cmake"

  # move lib32/clang to a separate package
  mkdir "$srcdir/clang.lib32.clang"
  mv "$pkgdir"/usr/lib32/clang  "$srcdir/clang.lib32.clang"
}

package_lib32-llvm-libs-rc(){
  pkgdesc='Low Level Virtual Machine (runtime library) (32-bit) (rc release)'
  depends=('lib32-libffi' 'lib32-zlib' 'lib32-ncurses' 'lib32-libxml2' 'lib32-gcc-libs')
  conflicts=('lib32-llvm-libs' 'lib32-llvm-libs-git' 'lib32-llvm-libs-stable')
  provides=('lib32-llvm-libs')

  install -d "$pkgdir/usr/lib32"

  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/usr/lib32/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/usr/lib32/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/usr/lib32/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-project-$pkgver.src/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-clang-rc(){
  pkgdesc='C language family frontend for LLVM (32-bit) (rc release)'
  depends=('lib32-llvm-libs' 'gcc-multilib')
  conflicts=('lib32-clang' 'lib32-clang-git' 'lib32-clang-stable')
  provides=('lib32-clang')

  install -d "$pkgdir"/usr/lib32

  # move clang lib to a separate package
  cp -a "$srcdir"/clang.lib32/* "$pkgdir"/usr/lib32/

  # move lib/cmake/clnag to a separate package
  cp -a "$srcdir/clang.cmake" "$pkgdir"/usr/lib32/cmake/

  # move clang lib to a separate package
  cp -a "$srcdir"/clang.lib32.clang/* "$pkgdir"/usr/lib32/

  install -Dm644 "$srcdir/llvm-project-$pkgver.src/clang/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
