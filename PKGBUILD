# Maintainer: Felix Schindler <aur at felixschindler dot net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang8
_pkgname=clang
pkgver=8.0.1
pkgrel=1
pkgdesc="C language family frontend for LLVM (8.x)"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm8-libs' 'gcc' 'compiler-rt8')
makedepends=('gcc8' 'llvm8' 'cmake' 'ninja' 'python-sphinx' 'python2')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm8: referenced by some clang headers')
provides=("$_pkgname=$pkgver" "clang-analyzer=$pkgver" "clang-tools-extra=$pkgver")
conflicts=("$_pkgname" 'clang-analyzer' 'clang-tools-extra')
replaces=("$_pkgname" 'clang-analyzer' 'clang-tools-extra')
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/cfe-$pkgver.src.tar.xz
        https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/clang-tools-extra-$pkgver.src.tar.xz
        https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-$pkgver.src.tar.xz
        0001-OpenCL-Change-type-of-block-pointer-for-OpenCL.patch
        0002-OpenCL-Simplify-LLVM-IR-generated-for-OpenCL-blocks.patch
        0003-OpenCL-Fix-assertion-due-to-blocks.patch
        clang-doc-build-as-clang_tool.patch
        0001-Fix-uninitialized-value-in-ABIArgInfo.patch
        enable-SSP-and-PIE-by-default.patch)
sha256sums=('70effd69f7a8ab249f66b0a68aba8b08af52aa2ab710dfb8a0fba102685b1646'
            '187179b617e4f07bb605cc215da0527e64990b4a7dd5cbcc452a16b64e02c3e1'
            '44787a6d02f7140f145e2250d56c9f849334e11f9ae379827510ed72f12b75e7'
            'fbb6d3c8135942e458bcad8882605a623bcd09bdec488eb0800e3afee0061e3a'
            '91c49139e02c6d29f6201aa394868939b991b39b84215c082392ea96fbd8c334'
            '191434810b5298331908ea1e193203e8441693da900238344e946ee6a79dad31'
            '1dfa5f93c0c084b8a25ca79ef9e2fe63a476826629e8ef366e0a6eaf5fa10625'
            'b7f31bcf03255f6a9b51b02935648e015ea538a0eef0b0c6d9c052fc5accb0c4'
            '58f86da25eb230ed6d423b5b61870cbf3bef88f38103ca676a2c7f34b2372171')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/cfe-$pkgver.src"
  mkdir build
  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/extra
  patch -Np1 -i ../enable-SSP-and-PIE-by-default.patch

  # The following patch was reverted upstream because it triggered an ICE with
  # GCC 7; however, we need it to pass the test suite when building with GCC 9
  # https://bugs.llvm.org/show_bug.cgi?id=40547
  patch -Np1 -i ../0001-Fix-uninitialized-value-in-ABIArgInfo.patch

  # Backported patches for intel-opencl-clang and intel-compute-runtime
  patch -Np1 -i ../0001-OpenCL-Change-type-of-block-pointer-for-OpenCL.patch
  patch -Np1 -i ../0002-OpenCL-Simplify-LLVM-IR-generated-for-OpenCL-blocks.patch
  patch -Np1 -i ../0003-OpenCL-Fix-assertion-due-to-blocks.patch

  # Fix inclusion of /usr/bin/clang-doc
  patch -Np1 -d tools/extra <../clang-doc-build-as-clang_tool.patch
}

build() {
  cd "$srcdir/cfe-$pkgver.src/build"

  export CC=cc-8
  export CXX=c++-8

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src" \
    -DLLVM_CMAKE_PATH="$srcdir/llvm-$pkgver.src/cmake/modules"
  ninja
}

# There are 5 unexpected failures (which is not good!), but what to do about them?
#check() {
#  cd "$srcdir/cfe-$pkgver.src/build"
#  ninja check-clang{,-tools}
#}

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
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/clang{,-tools}/html/{_sources,.buildinfo}

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/usr/libexec/{ccc,c++}-analyzer "$pkgdir/usr/lib/clang/"
  rmdir "$pkgdir/usr/libexec"
  sed -i 's|libexec|lib/clang|' "$pkgdir/usr/bin/scan-build"

  # Install Python bindings
  for _py in 2.7 3.7; do
    install -d "$pkgdir/usr/lib/python$_py/site-packages"
    cp -a ../bindings/python/clang "$pkgdir/usr/lib/python$_py/site-packages/"
    _python${_py%%.*}_optimize "$pkgdir/usr/lib/python$_py"
  done

  # Fix shebang in Python 2 script
  sed -i '1s|/usr/bin/env python$|&2|' \
    "$pkgdir"/usr/share/$_pkgname/run-find-all-symbols.py

  # Compile Python scripts
  _python2_optimize "$pkgdir/usr/share/clang"
  _python3_optimize "$pkgdir/usr/share" -x 'clang-include-fixer|run-find-all-symbols'
}

# vim:set ts=2 sw=2 et:
