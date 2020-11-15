# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm11' 'llvm11-libs' 'llvm11-ocaml')
_pkgname='llvm'
pkgver=11.0.0
pkgrel=3
_ocaml_ver=4.11.1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             "ocaml>=$_ocaml_ver" 'ocaml-ctypes' 'ocaml-findlib'
             'python-setuptools' 'python-psutil' 'python-sphinx'
             'python-recommonmark')
options=('staticlibs')
provides=('llvm' 'llvm-libs' 'llvm-ocaml')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/${_pkgname}-$pkgver.src.tar.xz{,.sig}
        llvm-config.h)
sha256sums=('913f68c898dfb4a03b397c5e11c6a2f39d0f22ed7665c9cefa87a34423a72469'
            'SKIP'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/llvm-$pkgver.src"
  mkdir build
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_BINUTILS_INCDIR=/usr/include
  ninja all ocaml_doc
}

check() {
  cd "$srcdir/llvm-$pkgver.src/build"
  ninja check
}

package_llvm11() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
  depends=('llvm-libs' 'perl')

  cd "$srcdir/llvm-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd ../utils/lit
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/${_pkgname}/html/{_sources,.buildinfo}

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/usr/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/usr/lib/LLVMgold.so "$srcdir"

  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/ocaml.{lib,doc}
  mv "$pkgdir/usr/lib/ocaml" "$srcdir/ocaml.lib"
  mv "$pkgdir/usr/share/doc/${_pkgname}/ocaml-html" "$srcdir/ocaml.doc"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/usr/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/usr/include/llvm/Config/llvm-config.h"
  fi

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

package_llvm11-libs() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/usr/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/usr/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/usr/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/usr/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

package_llvm11-ocaml() {
  pkgdesc="OCaml bindings for LLVM"
  depends=('llvm' "ocaml=$_ocaml_ver" 'ocaml-ctypes')

  install -d "$pkgdir"/{usr/lib,usr/share/doc/${_pkgname}}
  cp -a "$srcdir/ocaml.lib" "$pkgdir/usr/lib/ocaml"
  cp -a "$srcdir/ocaml.doc" "$pkgdir/usr/share/doc/${_pkgname}/html"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
