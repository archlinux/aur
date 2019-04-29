# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: yurikoles <root@yurikoles.com>
# Contributor: bearoso <bearoso@gmail.com>
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Hesiod (https://github.com/hesiod)
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>


pkgname=('llvm-lw-git' 'llvm-libs-lw-git' 'llvm-ocaml-lw-git')
pkgver=9.0.0_r315265.6c9f6fd11b6
pkgrel=1
_ocaml_ver=4.07.1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('git' 'cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             "ocaml=$_ocaml_ver" 'ocaml-ctypes' 'ocaml-findlib'
             'python-sphinx' 'python-recommonmark')
options=('staticlibs')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git"
        llvm-config.h)
sha256sums=('SKIP'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')

pkgver() {
    cd llvm-project/llvm

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             CMakeLists.txt)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver}"
}

build() {
    
    if [  -d _build ]; then
        rm -rf _build
    fi
    mkdir _build
    cd _build

    cmake "$srcdir"/llvm-project/llvm  -G Ninja \
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
        -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
        -DLLVM_BINUTILS_INCDIR=/usr/include \
        -DLLVM_VERSION_SUFFIX="" \
        -DLLVM_APPEND_VC_REV=ON
    if [[ ! $NINJAFLAGS ]]; then
        ninja all ocaml_doc
    else
        ninja "$NINJAFLAGS" all ocaml_doc
    fi
}

check() {
  cd _build
  ninja check
}

package_llvm-lw-git() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
  depends=('llvm-libs-lw-git' 'perl')
  optdepends=('python-setuptools: for using lit (LLVM Integrated Tester)')
  conflicts=('llvm')
  provides=(llvm=$pkgver-$pkgrel llvm-git=$pkgver-$pkgrel)

  cd _build

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd "$srcdir"/llvm-project/llvm/utils/lit 
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/llvm/html/{_sources,.buildinfo}

  
  # The runtime libraries go into llvm-lw-libs
  mv -f "$pkgdir"/usr/lib/lib{LLVM-*.so,LTO.so.*} "$srcdir"

  # Remove files which conflict with llvm-libs
  rm "$pkgdir"/usr/lib/{LLVMgold,lib{LLVM,LTO}}.so
  
  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/ocaml.{lib,doc}
  mv "$pkgdir"/usr/lib/ocaml "$srcdir"/ocaml.lib
  mv "$pkgdir"/usr/share/doc/llvm/ocaml-html "$srcdir"/ocaml.doc

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir"/usr/include/llvm/Config/llvm-config{,-64}.h
    cp "$srcdir"/llvm-config.h "$pkgdir"/usr/include/llvm/Config/llvm-config.h
  fi

  install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

package_llvm-libs-lw-git() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
  provides=(llvm-libs-git=$pkgver-$pkgrel)

  install -d "$pkgdir/usr/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO}*.so* \
    "$pkgdir"/usr/lib/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_llvm-ocaml-lw-git() {
  pkgdesc="OCaml bindings for LLVM"
  depends=('llvm' "ocaml=$_ocaml_ver" 'ocaml-ctypes')
  conflicts=('llvm-ocaml')
  provides=(llvm-ocaml=$pkgver-$pkgrel llvm-ocaml-git=$pkgver-$pkgrel)

  install -d "$pkgdir"/{usr/lib,usr/share/doc/$pkgname}
  cp -a "$srcdir"/ocaml.lib "$pkgdir"/usr/lib/ocaml
  cp -a "$srcdir"/ocaml.doc "$pkgdir"/usr/share/doc/$pkgname/html

  install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
