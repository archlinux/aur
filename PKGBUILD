# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyrsistent
_name=${pkgname#python-}
pkgver=0.19.3
pkgrel=5
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=('glibc' 'python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-hypothesis')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('6bb70b6fd65b5cd9f961a3199c2d90725aaa66fb869e4eba2143735e2f3a7e4ecdc782b3498acc2d92e263c3bed14cec8cc77324f4ebd08c300ba6735db5ecf7')

build() {
  cd pyrsistent-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd pyrsistent-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd pyrsistent-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.mit -t "$pkgdir"/usr/share/licenses/$pkgname/
}
