# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=protobuf-git
pkgname=('protobuf-git' 'python-protobuf-git')
pkgver=3.12.3.r112.g36d39a026
pkgrel=1
pkgdesc="Google's data interchange format"
arch=('i686' 'x86_64')
url="https://developers.google.com/protocol-buffers/"
license=('BSD')
makedepends=('git' 'python-setuptools' 'unzip')
source=("git+https://github.com/protocolbuffers/protobuf.git")
sha256sums=('SKIP')


prepare() {
  cd "protobuf"

  git submodule update --init --recursive
}

pkgver() {
  cd "protobuf"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "protobuf"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make

  cd "python"
  python "setup.py" build \
    --cpp_implementation
}

check() {
  cd "protobuf"

  #make check

  cd "python"
  #python "setup.py" test
}

package_protobuf-git() {
  depends=('gcc-libs' 'zlib')
  provides=('protobuf' 'libprotoc.so' 'libprotobuf.so' 'libprotobuf-lite.so')
  conflicts=('protobuf')
  options=('staticlibs')

  cd "protobuf"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/protobuf"
  install -Dm644 "editors/protobuf-mode.el" -t "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 "editors/proto.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"
}

package_python-protobuf-git() {
  pkgdesc="Python 3 bindings for Google Protocol Buffers"
  depends=('protobuf-git' 'python' 'python-six')
  provides=('python-protobuf')
  conflicts=('python-protobuf')

  cd "protobuf"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/python-protobuf"

  cd "python"
  python "setup.py" install \
    --optimize 1 \
    --skip-build \
    --root "$pkgdir" \
    --cpp_implementation
}
