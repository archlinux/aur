# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=brotli-git
pkgname=('brotli-git' 'python-brotli-git' 'python2-brotli-git')
pkgver=0.6.0.r29.g019091f
pkgrel=2
pkgdesc="Brotli compression library"
arch=('i686' 'x86_64')
url="https://github.com/google/brotli"
license=('MIT')
makedepends=('git' 'cmake' 'python' 'python2')
source=("git+https://github.com/google/brotli.git")
sha256sums=('SKIP')


pkgver() {
  cd "brotli"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "brotli"

  python ./setup.py build
  python2 ./setup.py build

  mkdir -p "build"
  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_BUILD_TYPE=Release ../
  make
}

check() {
  cd "brotli"

  make test
}

package_brotli-git() {
  depends=('glibc')
  provides=('brotli')
  conflicts=('brotli')

  cd "brotli/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/brotli/LICENSE"
}

package_python-brotli-git() {
  depends=('python')
  provides=('python-brotli')
  conflicts=('python-brotli')

  cd "brotli"

  python ./setup.py install --skip-build --root="$pkgdir"
}

package_python2-brotli-git() {
  depends=('python2')
  provides=('python2-brotli')
  conflicts=('python2-brotli')

  cd "brotli"

  python2 ./setup.py install --skip-build --root="$pkgdir"
}
