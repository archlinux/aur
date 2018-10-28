# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang6
pkgver=6.0.1
pkgrel=3
_prefix="/usr/lib/clang6"
pkgdesc="C language family frontend for LLVM"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm6-libs' 'gcc' 'compiler-rt')
makedepends=('llvm6' 'cmake' 'ninja' 'python-sphinx' 'python2')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for git-clang-format'
            'python2: for scan-view')
#provides=("clang-analyzer=$pkgver" "clang-tools-extra=$pkgver")
#conflicts=('clang-analyzer' 'clang-tools-extra')
#replaces=('clang-analyzer' 'clang-tools-extra')
source=(https://releases.llvm.org/$pkgver/cfe-$pkgver.src.tar.xz{,.sig}
        https://releases.llvm.org/$pkgver/clang-tools-extra-$pkgver.src.tar.xz{,.sig}
        https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz{,.sig}
        enable-SSP-and-PIE-by-default.patch)
sha256sums=('7c243f1485bddfdfedada3cd402ff4792ea82362ff91fbdac2dae67c6026b667'
            'SKIP'
            '0d2e3727786437574835b75135f9e36f861932a958d8547ced7e13ebdda115f1'
            'SKIP'
            'b6d6c324f9c71494c0ccaf3dac1f16236d970002b42bb24a6c9e1634f7d0f4e2'
            'SKIP'
            '28d38b7f4bcaa0c974f8c48d732a0db309ea89ffa901c39de90725ae857946c1')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/cfe-$pkgver.src"
  mkdir build
  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/extra
  patch -Np1 -i ../enable-SSP-and-PIE-by-default.patch
}

build() {
  cd "$srcdir/cfe-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${_prefix}" \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DBUILD_SHARED_LIBS=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_INCLUDE_DOCS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  ninja
}

check() {
  cd "$srcdir/cfe-$pkgver.src/build"
  ninja check-clang{,-tools}
}

_python2_optimize() {
  python2 -m compileall "$@"
  python2 -O -m compileall "$@"
}

_python3_optimize() {
  python3 -m compileall "$@"
  python3 -O -m compileall "$@"
  python3 -OO -m compileall "$@"
}

package() {
  cd "$srcdir/cfe-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir/$_prefix/share/doc/"clang{,-tools}/html/{_sources,.buildinfo}

##
## NOTE: we skip the below steps because we install to /usr/lib/clang6
##
#   # Move analyzer scripts out of $_prefix/libexec
#   mv "$pkgdir/$_prefix/"libexec/{ccc,c++}-analyzer "$pkgdir/$_prefix/lib/clang/"
#   rmdir "$pkgdir/$_prefix/libexec"
#   sed -i 's|libexec|lib/clang6|' "$pkgdir"/"$_prefix"/bin/scan-build
#
#   # Install Python bindings, rename them from "clang" to "clang6"
#   for _py in 2.7 3.7; do
#     install -d "$pkgdir/usr/lib/python$_py/site-packages"
#     cp -a ../bindings/python/clang "$pkgdir/usr/lib/python$_py/site-packages/clang6"
#     sed -i 's|clang\.enumerations|clang6.enumerations|' "$pkgdir/usr/lib/python$_py/site-packages/clang6/"*.py
#     _python${_py%%.*}_optimize "$pkgdir/usr/lib/python$_py"
#   done

  # Fix shebang in Python 2 scripts
  sed -i '1s|/usr/bin/env python$|&2|' \
    "$pkgdir/$_prefix/bin/scan-view" \
    "$pkgdir/$_prefix/share/clang/"*.py

  # Compile Python scripts
  _python2_optimize "$pkgdir/$_prefix/share"

  # symlink binaries from /usr/bin
  install -d "$pkgdir/usr/bin"
  cd "$pkgdir/$_prefix/bin"
  for file in *; do
    ln -sf "$_prefix/bin/$file" "$pkgdir/usr/bin/${file%-6.0}-6"
  done
}

# vim:set ts=2 sw=2 et:
