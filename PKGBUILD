#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgbase=llvm-stable
pkgname=("$pkgbase" 'llvm-libs-stable' 'llvm-ocaml-stable')
url='https://llvm.org/'
pkgver=12.0.0
pkgrel=1
arch=('x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2' 'ocaml' 'ocaml-ctypes' 'ocaml-findlib' 'python-setuptools' 'python-psutil' 'python-sphinx' 'python-recommonmark')
options=('staticlibs')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"
        "llvm-config.h")
md5sums=('SKIP'
         'SKIP')

build(){
  cd llvm-project-$pkgver.src/llvm

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLLVM_HOST_TRIPLE=$CHOST \
  -DLLVM_BUILD_LLVM_DYLIB=ON \
  -DLLVM_LINK_LLVM_DYLIB=ON \
  -DLLVM_INSTALL_UTILS=ON \
  -DLLVM_ENABLE_RTTI=ON \
  -DLLVM_ENABLE_FFI=ON \
  -DLLVM_BUILD_TESTS=ON \
  -DLLVM_BUILD_DOCS=OFF \
  -DLLVM_ENABLE_SPHINX=OFF \
  -DLLVM_ENABLE_DOXYGEN=OFF \
  -DSPHINX_WARNINGS_AS_ERRORS=OFF \
  -DLLVM_BINUTILS_INCDIR=/usr/include

  ninja -C build all
  ninja -C build ocaml_doc
}

package_llvm-stable(){
  pkgdesc='Collection of modular and reusable compiler and toolchain technologies'
  depends=('llvm-libs' 'perl')
  conflicts=('llvm' 'llvm-git' 'llvm-rc')
  provides=('llvm')

  cd llvm-project-$pkgver.src/llvm/build

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd ../utils/lit
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # Remove documentation sources
  #rm -r "$pkgdir"/usr/share/doc/llvm/html/{_sources,.buildinfo}

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/usr/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/usr/lib/LLVMgold.so "$srcdir"

  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/ocaml.{lib,doc}
  mv "$pkgdir/usr/lib/ocaml" "$srcdir/ocaml.lib"
  mv "$pkgdir/usr/share/doc/llvm/ocaml-html" "$srcdir/ocaml.doc"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/usr/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/usr/include/llvm/Config/llvm-config.h"
  fi

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # remove doc dir
  rm -rf "$pkgdir"/usr/share/doc
}

package_llvm-libs-stable(){
  pkgdesc='LLVM runtime libraries'
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
  conflicts=('llvm-libs' 'llvm-libs-git' 'llvm-libs-rc')
  provides=('llvm-libs')

  install -d "$pkgdir/usr/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/usr/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/usr/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/usr/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-project-$pkgver.src/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm-ocaml-stable(){
  pkgdesc='OCaml bindings for LLVM'
  depends=('llvm' "ocaml" 'ocaml-ctypes')
  conflicts=('llvm-ocaml' 'llvm-ocaml-git' 'llvm-ocaml-rc')
  provides=('llvm-ocaml')

  #install -d "$pkgdir"/{usr/lib,usr/share/doc/$pkgname}
  install -d "$pkgdir"/usr/lib
  cp -a "$srcdir/ocaml.lib" "$pkgdir/usr/lib/ocaml"
  #cp -a "$srcdir/ocaml.doc" "$pkgdir/usr/share/doc/$pkgname/html"

  install -Dm644 "$srcdir/llvm-project-$pkgver.src/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
