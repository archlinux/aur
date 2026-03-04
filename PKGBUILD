# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=1.0.0
pkgrel=1
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
depends=('python-msgpack' 'python-pytz')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('tarantool' 'python-dbapi-compliance' 'python-yaml')
source=("git+$url#tag=$pkgver")
sha512sums=('770e0fc4fba28b34dfdfee9270eb4f280e09f378e87f5f1fb5641ef3791e77aaaf1b91a5e1bc5002132d90ee294acd790157f00ffe949d862568a583c01a275c')

prepare() {
  cd tarantool-python
  sed -i "s/'setuptools_scm==6.4.2'/'setuptools_scm'/" setup.py
}

build() {
  cd tarantool-python
  python -m build --wheel --no-isolation
}

check() {
  cd tarantool-python
  make testdata
  
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  TEST_PURE_INSTALL=true test-env/bin/python -m unittest test.suites
}

package() {
  cd tarantool-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
