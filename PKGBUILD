# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Based on the python-scipy PKGBUILD

_name=scipy
pkgname=python-scipy-git
pkgver=0.17pre.r15964.g0a6aad03f6
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science and engineering. Git version"
arch=('x86_64')
url="https://www.scipy.org/"
license=(BSD)
conflicts=(python-scipy)
provides=(python-scipy scipy)
depends=(python-numpy)
makedepends=(gcc-fortran python-setuptools pybind11 python-pythran cython)
checkdepends=(python-pytest)
optdepends=('python-pillow: Image saving module')
source=("git+https://github.com/scipy/scipy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd scipy
  git submodule update --init
  cd tools
  touch __init__.py
  cd ..
  python setup.py config_fc build
}

check() {
  cd scipy
  python setup.py config_fc install \
    --prefix=/usr --root="$srcdir"/test --optimize=1
  export PYTHONPATH="$srcdir"/test/usr/lib/python3.11/site-packages
  cd ..
  python -c "from scipy import test; test('full')"
}

package() {
  cd scipy
  python3 setup.py config_fc install \
    --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
