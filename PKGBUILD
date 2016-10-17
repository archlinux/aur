# Maintainer: Chris Kitching <chriskitching@linux.com>

pkgname=lldb-git
pkgver=150510f
pkgrel=1
pkgdesc="The LLDB Debugger, git mirror"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA')
depends=('gcc-libs' 'libffi' 'python2' "gcc>=$_gcc_ver" 'libedit' 'llvm' 'clang')
makedepends=('svn' 'cmake' 'swig' 'rsync')
provides=('lldb')
conflicts=('lldb')
source=(
  "llvm::git+https://github.com/llvm-mirror/llvm.git"
  "clang::git+https://github.com/llvm-mirror/clang.git"
  "lldb::git+https://github.com/llvm-mirror/lldb.git"
  "wchar.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '0c89b7a2edb4761023815f953902da1fdde2642a513698927dd5a894636f71c8'
)

pkgver() {
  cd "$srcdir/lldb"
  echo $(git describe --always)
}

prepare() {
  cd "$srcdir"

  msg2 "Applying fix for https://bugs.archlinux.org/task/49974"
  cd lldb
  patch -p1 -i "$srcdir/wchar.patch"
  cd -

  msg2 "Shifting Clang/LLDB into LLVM tree (because they are idiots and don't use submodules) ..."
  yes | rm -Rf llvm/tools/clang llvm/tools/lldb
  cp -R clang llvm/tools/clang
  cp -R lldb llvm/tools/lldb
}

build() {
  cd "$srcdir"
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
    "$srcdir/llvm"

  make
}

package() {
  cd "$srcdir/llvm"

  # Install the license
  install -Dm644 tools/lldb/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir/build"

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
