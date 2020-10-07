# Maintainer: soloturn@gmail.com
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('swift-llvm-git' 'swift-llvm-libs-git')
instprefix="usr/lib/swift-llvm-git"
pkgver=swift.DEVELOPMENT.SNAPSHOT.2020.09.28.a.r106.ga3d312281b3d
pkgrel=1
arch=('x86_64')
url="https://github.com/apple/swift-llvm"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'git' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'python-sphinx' 'python-recommonmark')
options=('staticlibs')
source=(
  git+https://github.com/apple/llvm-project#branch=swift/main
# do not do in a first version until somebody reports a bug
#  llvm-config.h
)
sha256sums=(
  'SKIP'
)
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/llvm-project/llvm"
  mkdir -p build
  # permission test fails when building in a docker image
  rm test/tools/llvm-ar/error-opening-permission.test
}

pkgver() {
    cd "$srcdir/llvm-project"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/llvm-project/llvm/build"

  ls -l ..
  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/$instprefix\
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=AVR \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_BINUTILS_INCDIR=/usr/include
  ninja all
}

check() {
  cd "$srcdir/llvm-project/llvm/build"
#  ninja check
}

package_swift-llvm-git() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
  depends=('swift-llvm-libs' 'perl')
  optdepends=('python-setuptools: for using lit (LLVM Integrated Tester)')
  conflicts=(swift-llvm)
  provides=(swift-llvm)

  cd "$srcdir/llvm-project/llvm/build"

  DESTDIR="$pkgdir" ninja install

  # remove ocaml in case it was installed
  rm -rf "$pkgdir"/$instprefix/usr/lib/ocaml/

# lit is not swift specific, do not install
# # Include lit for running lit-based tests in other projects
# pushd ../utils/lit
# python3 setup.py install --root="$pkgdir" -O1
# popd

# not necessary as sources are not in pkg, but remove doc
#  # Remove documentation sources
#  rm -r "$pkgdir"/$instprefix/share/doc/$pkgname/html/{_sources,.buildinfo}
  rm -r "$pkgdir"/$instprefix/share/doc/

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/$instprefix/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/$instprefix/lib/LLVMgold.so "$srcdir"

# do not do in a first version until somebody reports a bug
#  if [[ $CARCH == x86_64 ]]; then
#    # Needed for multilib (https://bugs.archlinux.org/task/29951)
#    # Header stub is taken from Fedora
#    mv "$pkgdir/$instprefix/include/llvm/Config/llvm-config"{,-64}.h
#    cp "$srcdir/llvm-config.h" "$pkgdir/$instprefix/include/llvm/Config/llvm-config.h"
#  fi

  install -Dm644 ../LICENSE.TXT "$pkgdir/$instprefix/share/licenses/$pkgname/LICENSE"
}

package_swift-llvm-libs-git() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
  conflicts=(swift-llvm-libs)
  provides=(swift-llvm-libs)

  install -d "$pkgdir/$instprefix/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/$instprefix/lib/"

  # Symlink LLVMgold.so from /$instprefix/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/$instprefix/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/$instprefix/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-project/LICENSE.txt" \
    "$pkgdir/$instprefix/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et

