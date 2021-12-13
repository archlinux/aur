# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=brotli-git
pkgname=('brotli-git' 'python-brotli-git')
pkgver=1.0.9.r33.g4ec6703
pkgrel=1
pkgdesc="Brotli compression library"
arch=('i686' 'x86_64')
url="https://github.com/google/brotli"
license=('MIT')
makedepends=('git' 'cmake' 'python-setuptools')
source=("git+https://github.com/google/brotli.git")
sha256sums=('SKIP')


pkgver() {
  cd "brotli"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "brotli"

  python "setup.py" build

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "brotli"

  make -C "_build" test
}

package_brotli-git() {
  depends=('glibc')
  provides=('brotli' 'libbrotlicommon.so' 'libbrotlidec.so' 'libbrotlienc.so')
  conflicts=('brotli')

  cd "brotli"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/brotli"
}

package_python-brotli-git() {
  depends=('python')
  provides=('python-brotli')
  conflicts=('python-brotli')

  cd "brotli"

  python "setup.py" install \
    --optimize 1 \
    --skip-build \
    --root "$pkgdir"
}
