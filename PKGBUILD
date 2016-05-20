# $Id$
# Maintainer: Vladimir Still <vl.still@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Martin Peres <martin.peres@free.fr>

# Adapted from llvm37-split and llvm-3.6.2

pkgname=('llvm36-split' 'llvm36-libs-split' 'llvm36-ocaml-split' 'lldb36-split' 'clang36-split' 'clang36-analyzer-split' 'clang36-tools-extra-split')
pkgver=3.6.2
_vers_short=`echo $pkgver | cut -d. -f 1-2`
_prefix=/usr/lib/llvm-${_vers_short}/
pkgrel=1
_ocaml_ver=4.02.3
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('cmake' 'libffi' 'python2' "ocaml=$_ocaml_ver" 'python-sphinx'
             'python2-sphinx' 'chrpath' 'ocaml-ctypes' 'ocaml-findlib' 'libedit'
             'swig')
# Use gcc-multilib to build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('gcc-multilib')
options=('staticlibs')
source=(http://llvm.org/releases/$pkgver/llvm-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/cfe-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/clang-tools-extra-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/compiler-rt-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/lldb-$pkgver.src.tar.xz{,.sig}
        llvm-3.6.0-use-ocamlfind-for-ocamldoc.patch
        llvm-ocaml-ctypes-0.4.patch
        llvm-Config-config.h
        llvm-Config-llvm-config.h)
sha256sums=('f60dc158bfda6822de167e87275848969f0558b3134892ff54fced87e4667b94'
            'SKIP'
            'ae9180466a23acb426d12444d866b266ff2289b266064d362462e44f8d4699f3'
            'SKIP'
            '6a0ec627d398f501ddf347060f7a2ccea4802b2494f1d4fd7bda3e0442d04feb'
            'SKIP'
            '0f2ff37d80a64575fecd8cf0d5c50f7ac1f837ddf700d1855412bb7547431d87'
            'SKIP'
            '940dc96b64919b7dbf32c37e0e1d1fc88cc18e1d4b3acf1e7dfe5a46eb6523a9'
            'SKIP'
            '7e62bd5dd1ae5755a63abab692ae366186be392104e232e6b3a10a4ea5807283'
            '0e45ad131908a121f628d1575d32b7ad522b3a7039b517dfef4aac25243f3e7f'
            '312574e655f9a87784ca416949c505c452b819fad3061f2cde8aced6540a19a3'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
validpgpkeys=('11E521D646982372EB577A1F8F0871F202119294'
              'B6C8F98282B944E3B0D5C2530FC3042E345AD05D')

prepare() {
  cd "$srcdir/llvm-$pkgver.src"

  # At the present, clang must reside inside the LLVM source code tree to build
  # See http://llvm.org/bugs/show_bug.cgi?id=4840
  mv "$srcdir/cfe-$pkgver.src" tools/clang

  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/clang/tools/extra

  mv "$srcdir/compiler-rt-$pkgver.src" projects/compiler-rt

  mv "$srcdir/lldb-$pkgver.src" tools/lldb

  # Fix docs installation directory
  sed -i 's:$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
    Makefile.config.in

  # Fix definition of LLVM_CMAKE_DIR in LLVMConfig.cmake
  sed -i '/@LLVM_CONFIG_CMAKE_DIR@/s:$(PROJ_cmake):$(PROJ_prefix)/share/llvm/cmake:' \
    cmake/modules/Makefile

  # Use Python 2
  find tools/lldb -name Makefile -exec sed -i 's/python-config/python2-config/' {} +
  sed -i 's|/usr/bin/env python|&2|' \
    tools/lldb/scripts/Python/{build-swig-Python,finish-swig-Python-LLDB}.sh

  # Fix docs/Makefile to use ocamlfind
  # http://llvm.org/bugs/show_bug.cgi?id=22737
  patch -Np1 -i ../llvm-3.6.0-use-ocamlfind-for-ocamldoc.patch

  # Fix build with ocaml-ctypes 0.4.x
  patch -Np1 -i ../llvm-ocaml-ctypes-0.4.patch

  mkdir build
}

build() {
  cd "$srcdir/llvm-$pkgver.src"

  # Include location of libffi headers in CPPFLAGS
  CPPFLAGS+=" $(pkg-config --cflags libffi)"

  # Force the use of GCC instead of clang
  CC=gcc CXX=g++ \
  ./configure \
    --prefix=${_prefix} \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-optimized \
    --enable-libffi \
    --enable-targets=all \
    --enable-bindings=ocaml \
    --disable-assertions \
    --with-binutils-include=/usr/include \
    --with-python=/usr/bin/python2

  make REQUIRES_RTTI=1
  make -C docs -f Makefile.sphinx man
  make -C docs -f Makefile.sphinx html
  make -C tools/clang/docs -f Makefile.sphinx html
}

package_llvm36-split() {
  pkgdesc="LLVM (installed in ${_prefix})"
  depends=("llvm36-libs-split=$pkgver-$pkgrel" 'perl')

  cd "$srcdir/llvm-$pkgver.src"

  # We move the clang directory out of the tree so it won't get installed and
  # then we bring it back in for the clang package
  mv tools/clang "$srcdir/"

  # Same for lldb
  mv tools/lldb "$srcdir/"

  # -j1 is due to race conditions during the installation of the OCaml bindings
  make -j1 DESTDIR="$pkgdir" install
  mv "$srcdir/clang" tools
  mv "$srcdir/lldb" tools

  # install llvm-config-3.6 into /usr/bin/
  install -d "$pkgdir/usr/bin"
  ln -s "${_prefix}/bin/llvm-config" "$pkgdir/usr/bin/llvm-config-3.6"

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir${_prefix}/lib/libLLVM-$pkgver.so" "$srcdir/"
  mv -f "$pkgdir${_prefix}/lib/libLLVM-${pkgver%.*}.so" "$srcdir/"
  mv -f "$pkgdir"${_prefix}/lib/{LLVMgold,libLTO,BugpointPasses}.so "$srcdir/"

  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/{ocaml,ocamldoc}
  mv "$pkgdir"${_prefix}/{lib/ocaml,share/doc/llvm/ocamldoc} "$srcdir"

  # Fix permissions of static libs
  chmod -x "$pkgdir"${_prefix}/lib/*.a

  # Get rid of example Hello transformation
  rm "$pkgdir"${_prefix}/lib/*LLVMHello.*

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stubs are taken from Fedora
    for _header in config llvm-config; do
      mv "$pkgdir${_prefix}/include/llvm/Config/$_header"{,-64}.h
      cp "$srcdir/llvm-Config-$_header.h" \
        "$pkgdir${_prefix}/include/llvm/Config/$_header.h"
    done
  fi

  # Install man pages
  install -d "$pkgdir${_prefix}/share/man/man1"
  cp docs/_build/man/*.1 "$pkgdir${_prefix}/share/man/man1/"

  # Install html docs
  install -d "$pkgdir${_prefix}/share/doc/$pkgname/html/"
  cp -r docs/_build/html/* "$pkgdir${_prefix}/share/doc/$pkgname/html/"
  rm -r "$pkgdir${_prefix}/share/doc/$pkgname/html/_sources"

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/$pkgname/LICENSE"
}

package_llvm36-libs-split() {
  pkgdesc="LLVM (runtime libraries, installed in ${_prefix})"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses')

  install -d "$pkgdir${_prefix}/lib"
  cp -P \
    "$srcdir/libLLVM-$pkgver.so" \
    "$srcdir/libLLVM-${pkgver%.*}.so" \
    "$srcdir"/{LLVMgold,libLTO,BugpointPasses}.so \
    "$pkgdir${_prefix}/lib/"

  # Symlink LLVMgold.so from ${_prefix}/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir${_prefix}/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir${_prefix}/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir${_prefix}/share/licenses/$pkgname/LICENSE"
}

package_llvm36-ocaml-split() {
  pkgdesc="OCaml bindings for LLVM (installed in ${_prefix})"
  depends=("llvm36-split=$pkgver-$pkgrel" "ocaml=$_ocaml_ver" 'ocaml-ctypes')

  cd "$srcdir/llvm-$pkgver.src"

  install -d "$pkgdir${_prefix}"/{lib,share/doc}
  cp -a "$srcdir/ocaml" "$pkgdir${_prefix}/lib/ocaml"
  cp -a "$srcdir/ocamldoc" "$pkgdir${_prefix}/share/doc/$pkgname"

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/llvm-ocaml/LICENSE"
}

package_lldb36-split() {
  pkgdesc="Next generation, high-performance debugger (installed in ${_prefix})"
  url="http://lldb.llvm.org/"
  depends=('libedit' 'libxml2' 'python2')

  cd "$srcdir/llvm-$pkgver.src/tools/lldb"

  make DESTDIR="$pkgdir" install

  # Fix permissions of static libs
  chmod -x "$pkgdir"${_prefix}/lib/*.a

  # Remove insecure rpath
  chrpath -d "$pkgdir"${_prefix}/bin/*

  # Compile Python scripts
  python2 -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/lldb"
  python2 -O -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/lldb"

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/lldb/LICENSE"
}

package_clang36-split() {
  pkgdesc="C language family frontend for LLVM (installed in ${_prefix})"
  url="http://clang.llvm.org/"
  depends=("llvm36-libs-split=$pkgver-$pkgrel" 'gcc')
  optdepends=('python2: for git-clang-format')

  # Fix installation path for clang docs
  sed -i 's:$(PROJ_prefix)/share/doc/llvm:$(PROJ_prefix)/share/doc/clang:' \
    "$srcdir/llvm-$pkgver.src/Makefile.config"

  cd "$srcdir/llvm-$pkgver.src/tools/clang"

  # We move the extra tools directory out of the tree so it won't get
  # installed and then we bring it back in for the clang-tools-extra package
  mv tools/extra "$srcdir"

  make DESTDIR="$pkgdir" install
  mv "$srcdir/extra" tools/

  # Fix permissions of static libs
  chmod -x "$pkgdir"${_prefix}/lib/*.a

  # Revert the path change in case we want to do a repackage later
  sed -i 's:$(PROJ_prefix)/share/doc/clang:$(PROJ_prefix)/share/doc/llvm:' \
    "$srcdir/llvm-$pkgver.src/Makefile.config"

  # Install html docs
  install -d "$pkgdir${_prefix}/share/doc/$pkgname/html"
  cp -r docs/_build/html/* "$pkgdir${_prefix}/share/doc/$pkgname/html/"
  rm -r "$pkgdir${_prefix}/share/doc/$pkgname/html/_sources"

  # Install Python bindings
  install -d "$pkgdir${_prefix}/lib/python2.7/site-packages"
  cp -r bindings/python/clang "$pkgdir${_prefix}/lib/python2.7/site-packages/"
  python2 -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/clang"
  python2 -O -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/clang"

  # Install clang-format editor integration files (FS#38485)
  # Destination paths are copied from clang-format/CMakeLists.txt
  install -d "$pkgdir${_prefix}/share/$pkgname"
  (
    cd tools/clang-format
    cp \
      clang-format-diff.py \
      clang-format-sublime.py \
      clang-format.el \
      clang-format.py \
      "$pkgdir${_prefix}/share/$pkgname/"
    cp git-clang-format "$pkgdir${_prefix}/bin/"
    sed -i 's|/usr/bin/env python|&2|' \
      "$pkgdir${_prefix}/bin/git-clang-format" \
      "$pkgdir${_prefix}/share/$pkgname/clang-format-diff.py"
  )

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/clang/LICENSE"
}

package_clang36-analyzer-split() {
  pkgdesc="A source code analysis framework (installed in ${_prefix})"
  url="http://clang-analyzer.llvm.org/"
  depends=("clang36-split=$pkgver-$pkgrel" 'python2')

  cd "$srcdir/llvm-$pkgver.src/tools/clang"

  install -d "$pkgdir"${_prefix}/{bin,lib/clang-analyzer}
  for _tool in scan-{build,view}; do
    cp -a tools/$_tool "$pkgdir${_prefix}/lib/clang-analyzer/"
    ln -s ${_prefix}/lib/clang-analyzer/$_tool/$_tool "$pkgdir${_prefix}/bin/"
  done

  # scan-build looks for clang within the same directory
  ln -s ${_prefix}/bin/clang "$pkgdir${_prefix}/lib/clang-analyzer/scan-build/"

  # Relocate man page
  install -d "$pkgdir${_prefix}/share/man/man1"
  mv "$pkgdir${_prefix}/lib/clang-analyzer/scan-build/scan-build.1" \
    "$pkgdir${_prefix}/share/man/man1/"

  # Use Python 2
  sed -i \
    -e 's|env python$|&2|' \
    -e 's|/usr/bin/python$|&2|' \
    "$pkgdir${_prefix}/lib/clang-analyzer/scan-view/scan-view" \
    "$pkgdir${_prefix}/lib/clang-analyzer/scan-build/set-xcode-analyzer"

  # Compile Python scripts
  python2 -m compileall "$pkgdir${_prefix}/lib/clang-analyzer"
  python2 -O -m compileall "$pkgdir${_prefix}/lib/clang-analyzer"

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/clang-analyzer/LICENSE"
}

package_clang36-tools-extra-split() {
  pkgdesc="Extra tools built using Clang's tooling APIs (installed in ${_prefix})"
  url="http://clang.llvm.org/"
  depends=("clang36-split=$pkgver-$pkgrel")

  cd "$srcdir/llvm-$pkgver.src/tools/clang/tools/extra"

  make DESTDIR="$pkgdir" install

  # Fix permissions of static libs
  chmod -x "$pkgdir"${_prefix}/lib/*.a

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/clang-tools-extra/LICENSE"
}

# vim:set ts=2 sw=2 et:
