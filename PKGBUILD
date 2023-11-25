# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Based on the python-scipy PKGBUILD

_name=scipy
pkgname=python-scipy-git
pkgver=0.17pre.r16790.g44ca7042b6
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science and engineering. Git version"
arch=('x86_64')
url="https://www.scipy.org/"
license=(BSD)
conflicts=(python-scipy)
provides=(python-scipy scipy)
depends=(python-numpy)
makedepends=(gcc-fortran python-setuptools pybind11 python-pythran cython python-build python-installer python-wheel meson-python)
checkdepends=(python-pytest)
optdepends=('python-pillow: Image saving module')
source=("git+https://github.com/scipy/scipy.git"
       "version.patch")
sha256sums=('SKIP'
	   'cea86e10eb47bd7a4bb35ea000a880854cbdc220c4002e207e5caec43e9c5517')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/scipy"
    patch --strip=1 --input=../version.patch
    }

build() {
  cd scipy
  git submodule update --init
  #cd tools
  #touch __init__.py
  #cd ..
  python -m build --wheel --no-isolation
}

#At present, check() fails with an ImportPathMismatchError
#check() {
  #cd scipy
  #python setup.py config_fc install \
  #  --prefix=/usr --root="$srcdir"/test --optimize=1
  #local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  #export PYTHONPATH="$srcdir"/test/usr/lib/python$python_version/site-packages
  #cd ..
  #python -c "from scipy import test; test('full')"
  #pytest
#}

package() {
  cd scipy
  #python3 setup.py config_fc install \
  #  --prefix=/usr --root="$pkgdir" --optimize=1

  #install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
