# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=qdldl-python
pkgname=python-qdldl
pkgver=0.1.7.post2
pkgrel=2
pkgdesc='Python interface to the QDLDL free LDL factorization routine for quasi-definite linear systems'
url='https://github.com/oxfordcontrol/qdldl-python/'
license=(Apache-2.0)
arch=(x86_64)
depends=(gcc-libs
         glibc
         python
         python-scipy)
makedepends=(cmake
             git
             pybind11
             python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest)
source=(git+https://github.com/osqp/$_pyname#tag=v.$pkgver
        git+https://github.com/oxfordcontrol/qdldl)
sha256sums=('ae19247d07341d65a7f52fc48696f406cf44726cf839bd531367054fbcefcaca'
            'SKIP')

prepare() {
  cd $_pyname
  git submodule init
  git submodule set-url c/qdldl "$srcdir"/qdldl
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_pyname
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
