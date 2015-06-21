# Maintainer: Muhammad Tauqir Ahmad <mtahmed@uwaterloo.ca>
# Contributor: Nicolas Hureau <aur@kalenz.fr>
# Contributor: Philipp Sieweck <psi@informatik.uni-kiel.de>
# Contributor: Xavier de Gaye <xdegaye@gmail.com>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=lldb-svn
_gcc_ver=4.6.2
pkgver=235563
pkgrel=1
pkgdesc="The LLDB Debugger"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA')
depends=('gcc-libs' 'libffi' 'python2' "gcc>=$_gcc_ver" 'libedit' 'llvm' 'clang')
makedepends=('svn' 'cmake' 'swig' 'rsync')
provides=('lldb')
conflicts=('lldb')
source=(
  "llvm::svn+http://llvm.org/svn/llvm-project/llvm/trunk"
  "cfe::svn+http://llvm.org/svn/llvm-project/cfe/trunk"
  "lldb::svn+http://llvm.org/svn/llvm-project/lldb/trunk"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/lldb"
  echo $(svnversion)
}

build() {
  cd "$srcdir"
  msg2 "Exporting Clang in the LLVM tree ..."
  svn export cfe llvm/tools/clang &> /dev/null
  msg2 "Exporting LLDB in the LLVM tree ..."
  svn export lldb llvm/tools/lldb &> /dev/null

  cd "$srcdir/llvm/tools/lldb"

  msg2 "Applying Archlinux-specific patch ..."

  sed -i -e "s|python-config|python2-config|" lib/Makefile
  sed -i -e "s|python-config|python2-config|" Makefile
  sed -i -e "s|/usr/bin/env python|&2|" scripts/Python/build-swig-Python.sh
  sed -i -e "s|/usr/bin/env python|&2|" scripts/Python/finish-swig-Python-LLDB.sh

  cd "$srcdir/llvm"
  msg2 "Starting build ..."

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  # libffi's includes are in a non-standard location :(
  _libffi_include=$(pkg-config libffi --cflags-only-I | sed 's/-I//')

  export CFLAGS="$CFLAGS -fno-tree-pre"
  export CXXFLAGS="$CXXFLAGS -fno-tree-pre"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=OFF \
    -DLLVM_ENABLE_FFI=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DFFI_INCLUDE_PATH=$_libffi_include \
    ..

  make
}

package() {
  cd "$srcdir/llvm"

  # Install the license
  install -Dm644 tools/lldb/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir/llvm/build"

  # Install the lldb binaries
  install -Dm755 bin/lldb "$pkgdir/usr/bin/lldb"
  install -Dm755 bin/lldb-mi "$pkgdir/usr/bin/lldb-mi"
  install -Dm755 bin/lldb-server "$pkgdir/usr/bin/lldb-server"

  # Install the lldb library
  install -Dm755 lib/liblldb.so "$pkgdir/usr/lib/liblldb.so"

  # Install the lldb python libraries.
  python_dir="$pkgdir/usr/lib/python2.7/site-packages"
  mkdir -p "$python_dir"
  cp -a lib/python2.7/site-packages/lldb "$python_dir"

  # Relink the _lldb.so for python
  ln -sf /usr/lib/liblldb.so "$python_dir/lldb/_lldb.so"

  # Install the lldb headers
  mkdir -p "$pkgdir/usr/include"
  rsync -rl --exclude=Makefile "$srcdir/lldb/include/lldb" "$pkgdir/usr/include"
}

# vim:set sts=2 sw=2 et:
