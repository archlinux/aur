pkgname=templight-git
pkgver=r138.91589f9
pkgrel=1
pkgdesc="Template Instantiation Profiler and Debugger"
arch=('x86_64')
url="https://github.com/mikael-s-persson/templight"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm-libs' 'gcc' 'clang' 'compiler-rt')
optdepends=('templight-tools: Additional facilities to process the profiling data.')
makedepends=('git' 'subversion' 'llvm' 'cmake')
provides=("templight")
conflicts=("templight")
source=(llvm::svn+http://llvm.org/svn/llvm-project/llvm/trunk
        cfe::svn+http://llvm.org/svn/llvm-project/cfe/trunk
        git://github.com/mikael-s-persson/templight.git
        GetArgumentVectorFix.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'dbc8086e8c2f05ddd4128fd3a0d39261eed19ffd0c9509a50ad656a8a5936c1f')

pkgver() {
  cd "$srcdir/templight"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/templight

  # Patch templight
  # https://github.com/mikael-s-persson/templight/issues/65
  patch -p1 -i ${srcdir}/GetArgumentVectorFix.patch
  
  # Checkout minimal clang and add templight to tools
  cp -r ${srcdir}/cfe                ${srcdir}/llvm/tools/clang
  cp -r ${srcdir}/templight          ${srcdir}/llvm/tools/clang/tools/templight
  echo "add_clang_subdirectory(templight)" >> ${srcdir}/llvm/tools/clang/tools/CMakeLists.txt
}

build() {
  mkdir -p "${srcdir}/llvm/build"
  cd "${srcdir}/llvm/build"

  cmake .. -DCMAKE_BUILD_TYPE=Release
  make templight
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/llvm/build/bin/templight++" "$pkgdir/usr/bin"
  install -Dm644 ${srcdir}/templight/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
