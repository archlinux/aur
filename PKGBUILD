# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=protobuf-git
pkgname=('protobuf-git' 'python-protobuf-git')
pkgver=21.12.r1098.gb598b2dd1
pkgrel=1
pkgdesc="Google's data interchange format"
arch=('i686' 'x86_64')
url="https://developers.google.com/protocol-buffers/"
license=('BSD')
makedepends=('git' 'cmake' 'gtest' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/protocolbuffers/protobuf.git")
sha256sums=('SKIP')


prepare() {
  cd "protobuf"

  git submodule update --init --recursive
}

pkgver() {
  cd "protobuf"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "protobuf"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_SHARED_LIBS=ON \
    -Dprotobuf_USE_EXTERNAL_GTEST=ON \
    ./
  make -C "_build"

  cd "python"
  python \
    -m build \
    --wheel \
    --no-isolation \
    --config-setting="--cpp_implementation"
}

check() {
  cd "protobuf"

  #make -C "_build" check

  cd "python"
  #python "setup.py" test
}

package_protobuf-git() {
  depends=('gcc-libs' 'zlib')
  provides=("protobuf=$pkgver" 'libprotoc.so' 'libprotobuf.so' 'libprotobuf-lite.so')
  conflicts=('protobuf')

  cd "protobuf"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/protobuf"
  install -Dm644 "editors/protobuf-mode.el" -t "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 "editors/proto.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"
}

package_python-protobuf-git() {
  pkgdesc="Python 3 bindings for Google Protocol Buffers"
  depends=("protobuf-git=$pkgver" 'python' 'python-six')
  provides=("python-protobuf=$pkgver")
  conflicts=('python-protobuf')

  cd "protobuf"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/python-protobuf"

  cd "python"
  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
}
