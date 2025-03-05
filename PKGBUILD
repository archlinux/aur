# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyrsistent
_name=${pkgname#python-}
pkgver=0.20.0
pkgrel=7
pkgdesc="Persistent/Functional/Immutable data structures"
arch=($CARCH)
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=('glibc' 'python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=('python-pytest' 'python-hypothesis')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "python3.13.patch::https://patch-diff.githubusercontent.com/raw/tobgu/pyrsistent/pull/284.patch")
sha512sums=('ac78c55e8687f12ae8729f2262a76a9257a6d6f4bbb5a01cb45ffb170d5c2044b1f26b3ed1359b2d722201507c32781f024b49b20d45faedf288823a98255a6f'
            'c3f77f75bfd8415f70df3bccc4ffc666ed3162703f939e2e5112875dc1028c8f4deee103e6863bc5a4bce35d6faa77e71a5b51931f74912c569ec3c8bfebc22a')

prepare() {
  cd pyrsistent-$pkgver
  patch -p1 -i ../python3.13.patch
}

build() {
  cd pyrsistent-$pkgver
  python -m build --wheel --no-isolation
}

# check() {
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#
#   cd pyrsistent-$pkgver
#   python -m installer --destdir=test_dir dist/*.whl
#   export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
#   pytest -vv
# }

package() {
  cd pyrsistent-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.mit -t "$pkgdir"/usr/share/licenses/$pkgname/
}
