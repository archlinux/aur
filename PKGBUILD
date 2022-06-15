# Maintainer: Lee Mracek <lee@leemracek.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgbase=flatbuffers-git
_gitbase=flatbuffers
pkgname=(flatbuffers-git python-flatbuffers-git)
pkgver=2.0.6.r118.g987aa5b5
pkgrel=1
pkgdesc='An efficient cross platform serialization library for C++, with support for Java, C# and Go'
arch=(x86_64)
url='https://google.github.io/flatbuffers/'
license=(Apache)
depends=(gcc-libs)
makedepends=(cmake git python-setuptools)
source=(git+https://github.com/google/flatbuffers)
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitbase}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's/-Werror=/-W/g;s/-Werror//g' $_gitbase/CMakeLists.txt
}

build() {
  cd $_gitbase
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DFLATBUFFERS_BUILD_FLATLIB=OFF \
    -DFLATBUFFERS_BUILD_SHAREDLIB=ON
  make

# Python bindings
  cd ../$_gitbase/python
  VERSION=$pkgver python setup.py build
}

check() {
  cd $_gitbase
  make test

  # python tests currently test multiple interpreters/benchmarks
  # and we don't need that
  # ./tests/PythonTest.sh
}

package_flatbuffers-git() {
  conflicts=('flatbuffers')
  provides=("flatbuffers=$pkgver")
  cd $_gitbase
  make DESTDIR="$pkgdir" install
  install -Dm755 flatc -t "$pkgdir"/usr/bin
}

package_python-flatbuffers-git() {
  pkgdesc='An efficient cross platform serialization library for Python'
  arch=(any)
  conflicts=('python-flatbuffers')
  depends=(python)
  provides=("python-flatbuffers=$pkgver")

  cd $_gitbase/python
  VERSION=$pkgver python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
