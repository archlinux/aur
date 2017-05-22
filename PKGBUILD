# $Id$
# Maintainer: Felix Schindler <aur at felixschindler dot net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

# pkgname=('llvm38' 'llvm-libs38' 'llvm-ocaml38' 'lldb38' 'clang38' 'clang-tools-extra38')
pkgname=('llvm38' 'llvm-libs38' 'lldb38' 'clang38' 'clang-tools-extra38')
_pkgname=clang38
pkgver=3.8.1
pkgrel=1
#_ocaml_ver=4.02.3
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
# makedepends=('cmake' 'libffi' 'python2' "ocaml=$_ocaml_ver" 'python-sphinx'
makedepends=('cmake' 'libffi' 'python2' 'python-sphinx'
             'libedit' 'swig')
# Use gcc-multilib to build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('gcc-multilib')
options=('staticlibs')
source=(http://llvm.org/releases/$pkgver/llvm-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/cfe-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/clang-tools-extra-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/compiler-rt-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/lldb-$pkgver.src.tar.xz{,.sig}
        D17567-PR23529-Sema-part-of-attrbute-abi_tag-support.patch
        D18035-PR23529-Mangler-part-of-attrbute-abi_tag-support.patch
        llvm-Config-llvm-config.h)
sha256sums=('6e82ce4adb54ff3afc18053d6981b6aed1406751b8742582ed50f04b5ab475f9'
            'SKIP'
            '4cd3836dfb4b88b597e075341cae86d61c63ce3963e45c7fe6a8bf59bb382cdf'
            'SKIP'
            '664a5c60220de9c290bf2a5b03d902ab731a4f95fe73a00856175ead494ec396'
            'SKIP'
            '0df011dae14d8700499dfc961602ee0a9572fef926202ade5dcdfe7858411e5c'
            'SKIP'
            '349148116a47e39dcb5d5042f10d8a6357d2c865034563283ca512f81cdce8a3'
            'SKIP'
            '406754764e83d58bc3b859ab4b7893abd48c760278c4619cf4341ef9b9b75c85'
            'd71f8677882c86accddb8a5b720f298a4d7a2ad3bce6091951a46396b8f14da1'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
validpgpkeys=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D'
              '11E521D646982372EB577A1F8F0871F202119294')

prepare() {
  cd "$srcdir/llvm-$pkgver.src"

  # At the present, clang must reside inside the LLVM source code tree to build
  # See http://llvm.org/bugs/show_bug.cgi?id=4840
  mv "$srcdir/cfe-$pkgver.src" tools/clang

  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/clang/tools/extra

  mv "$srcdir/compiler-rt-$pkgver.src" projects/compiler-rt

  mv "$srcdir/lldb-$pkgver.src" tools/lldb

  # https://llvm.org/bugs/show_bug.cgi?id=23529
  patch -d tools/clang -Np2 <../D17567-PR23529-Sema-part-of-attrbute-abi_tag-support.patch
  patch -d tools/clang -Np0 <../D18035-PR23529-Mangler-part-of-attrbute-abi_tag-support.patch

  mkdir build
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/$_pkgname \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_DYLIB_EXPORT_ALL=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include \
    -DLLVM_APPEND_VC_REV=ON \
    ..

  make
  # make ocaml_doc

  # Disable automatic installation of components that go into subpackages
  sed -i '/\(clang\|lldb\)\/cmake_install.cmake/d' tools/cmake_install.cmake
  sed -i '/extra\/cmake_install.cmake/d' tools/clang/tools/cmake_install.cmake
  sed -i '/compiler-rt\/cmake_install.cmake/d' projects/cmake_install.cmake
}

check() {
  cd "$srcdir/llvm-$pkgver.src/build"
  make check
  make check-clang
}

package_llvm38() {
  pkgdesc="Low Level Virtual Machine"
  depends=("llvm-libs38=$pkgver-$pkgrel" 'perl')

  cd "$srcdir/llvm-$pkgver.src"

  make -C build DESTDIR="$pkgdir" install

  # Remove documentation sources
  rm -rf "$pkgdir"/opt/$_pkgname/share/doc/$pkgname/html/{_sources,.buildinfo}

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/opt/$_pkgname/lib/lib{LLVM,LTO}*.so "$srcdir"
  mv -f "$pkgdir"/opt/$_pkgname/lib/LLVMgold.so "$srcdir"

  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/ocaml.{lib,doc}
  rm -rf "$pkgdir/opt/$_pkgname/lib/ocaml"
  rm -rf "$pkgdir/opt/$_pkgname/docs"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/opt/$_pkgname/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-Config-llvm-config.h" \
      "$pkgdir/opt/$_pkgname/include/llvm/Config/llvm-config.h"
  fi

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm-libs38() {
  pkgdesc="Low Level Virtual Machine (runtime libraries)"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses')

  install -d "$pkgdir/opt/$_pkgname/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO}*.so \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/$_pkgname/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/$_pkgname/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/$_pkgname/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

#package_llvm-ocaml38() {
#  pkgdesc="OCaml bindings for LLVM"
#  depends=("llvm38=$pkgver-$pkgrel" "ocaml=$_ocaml_ver" 'ocaml-ctypes')
#
#  cd "$srcdir/llvm-$pkgver.src"
#
#  install -d "$pkgdir"/{usr/lib,usr/share/doc}
#  cp -a "$srcdir/ocaml.lib" "$pkgdir/usr/lib/ocaml"
#  cp -a "$srcdir/ocaml.doc" "$pkgdir/usr/share/doc/$pkgname"
#
#  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#}

package_lldb38() {
  pkgdesc="Next generation, high-performance debugger"
  url="http://lldb.llvm.org/"
  depends=('libedit' 'libxml2' 'python2' 'python2-six')

  cd "$srcdir/llvm-$pkgver.src"

  make -C build/tools/lldb DESTDIR="$pkgdir" install

  # Remove bundled six library
  rm -f "$pkgdir/opt/$_pkgname/lib/python2.7/site-packages/six.py"

  # Compile Python scripts
  python2 -m compileall "$pkgdir/opt/$_pkgname/lib/python2.7/site-packages/lldb"
  python2 -O -m compileall "$pkgdir/opt/$_pkgname/lib/python2.7/site-packages/lldb"

  install -Dm644 tools/lldb/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_clang38() {
  pkgdesc="C language family frontend for LLVM"
  url="http://clang.llvm.org/"
  depends=("llvm-libs38=$pkgver-$pkgrel" 'gcc' 'libxml2')
  optdepends=('openmp: OpenMP support in clang with -fopenmp'
              'python2: for scan-view and git-clang-format')
  provides=("clang-analyzer38=$pkgver")
  conflicts=('clang-analyzer38')
  replaces=('clang-analyzer38')

  cd "$srcdir/llvm-$pkgver.src"

  make -C build/tools/clang DESTDIR="$pkgdir" install
  make -C build/projects/compiler-rt DESTDIR="$pkgdir" install

  # Remove documentation sources
  rm -rf "$pkgdir"/opt/$_pkgname/share/doc/$pkgname/html/{_sources,.buildinfo}

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/opt/$_pkgname/libexec/{ccc,c++}-analyzer "$pkgdir/opt/$_pkgname/lib/clang/"
  rmdir "$pkgdir/opt/$_pkgname/libexec"
  sed -i 's|libexec|lib/clang|' "$pkgdir/opt/$_pkgname/bin/scan-build"

  # Install Python bindings
  install -d "$pkgdir/opt/$_pkgname/lib/python2.7/site-packages"
  cp -a tools/clang/bindings/python/clang "$pkgdir/opt/$_pkgname/lib/python2.7/site-packages/"

  # Use Python 2
  sed -i 's|/usr/bin/env python|&2|' \
    "$pkgdir/opt/$_pkgname/bin/scan-view" \
    "$pkgdir/opt/$_pkgname/bin/git-clang-format" \
    "$pkgdir/opt/$_pkgname/share/clang/clang-format-diff.py"

  # Compile Python scripts
  python2 -m compileall "$pkgdir"
  python2 -O -m compileall "$pkgdir"

  install -Dm644 tools/clang/LICENSE.TXT \
    "$pkgdir/opt/$_pkgname/share/licenses/$pkgname/LICENSE"

  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s /opt/clang38/bin/clang clang-3.8
  ln -s /opt/clang38/bin/clang-format clang-format-3.8
}

package_clang-tools-extra38() {
  pkgdesc="Extra tools built using clang's tooling APIs"
  url="http://clang.llvm.org/"
  depends=("clang38=$pkgver-$pkgrel")

  cd "$srcdir/llvm-$pkgver.src"

  make -C build/tools/clang/tools/extra DESTDIR="$pkgdir" install

  # Use Python 2
  sed -i \
    -e 's|env python$|&2|' \
    -e 's|/usr/bin/python$|&2|' \
    "$pkgdir"/opt/$_pkgname/share/clang/{clang-tidy-diff,run-clang-tidy}.py

  install -Dm644 tools/clang/tools/extra/LICENSE.TXT \
    "$pkgdir/opt/$_pkgname/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
