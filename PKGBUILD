# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=1.1.0
pkgrel=1
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD-2-Clause')
depends=('python-msgpack' 'python-pytz')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('tarantool' 'python-dbapi-compliance' 'python-yaml')
source=("git+$url#tag=$pkgver")
sha512sums=('ec5f4624ff9c3ed62992394bca1345f5f17ca04ba98e864ae87fc8ac25068368a5d3d341e99977ab72e2ec6c26a214b8d84c11937e0e2e351623fccb97dc63a5')

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
