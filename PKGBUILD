pkgname=remill-git
pkgver=20170215
pkgrel=1
pkgdesc="Machine code to LLVM binary translator."
url="https://github.com/trailofbits/remill"
arch=('x86_64' 'i686')
license=('Apache License')
# NOTE: Depend on google-glog-git instead of google-glog to force a compilation,
# which makes glog discover the installed gflags package during compilation.

# NOTE: python2-protobuf is needed for IDA's local Python which is at version 2.
depends=('gtest' 'protobuf' 'gflags' 'python' 'python-protobuf' 'python2-protobuf' 'xed-intel' 'google-glog-git')
makedepends=('cmake' 'clang' 'llvm')
conflicts=('remill')

_gitroot='https://github.com/trailofbits/remill.git'
_gitname='remill'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  # TODO: Remove when https://github.com/trailofbits/remill/issues/96 is resolved.
  cp "$srcdir/$_gitname/tools/remill_disass/ida/disass.py" "$srcdir/$_gitname-build/tools/remill_disass/ida/disass.py"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  echo "[+] Compiling protobufs"
  ./scripts/unix/compile_protobufs.sh
  echo "[+] Running cmake"
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" -DLLVM_DIR=/usr/include/llvm -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DCMAKE_LLVM_LINK=/usr/bin/llvm-link .
  echo "[+] Building semantics"
  make semantics
  echo "[+] Building remill"
  make all
}

package() {
  cd "$srcdir/$_gitname-build"
  echo "[+] Installing"
  mkdir -p "$pkgdir/usr/lib/python3.6/site-packages"
  make PYTHONPATH="$pkgdir/usr/lib/python3.6/site-packages" install
}
