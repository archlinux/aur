# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

_pkgname=flit
pkgbase=python38-$_pkgname
pkgname=($pkgbase{,-core})
pkgver=3.8.0
pkgrel=2
pkgdesc='Simplified packaging of Python modules'
arch=('any')
url='https://github.com/takluyver/flit'
license=('BSD')
depends=('python38' 'python38-tomli' 'python-tomli-w')
makedepends=('python38-pip' 'python38-poetry-core' 'python-requests' 'python-docutils')
checkdepends=('python38-pytest' 'python38-testpath' 'python-responses')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c4af79e1511e647303dc6b0913d8526586580db8d916aa7c4a52a9ebb281b375b6082e961ac8be05c0fc8ffdd8c3ec858fcba4e7faea25f465895288fa09c355')

prepare() {
  cd $_pkgname-$pkgver
  rm tests/test_sdist.py
  cd flit_core
  python build_dists.py
}

build() {
  cd $_pkgname-$pkgver

  PYTHONPATH=flit_core python -m flit build --format wheel
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=flit_core python -m pytest
}

package_python38-flit() {
  depends+=('python-flit-core' 'python-requests' 'python-docutils')
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd $_pkgname-$pkgver

  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python38-flit-core() {
  pkgdesc+=' (core backend)'

  cd $_pkgname-$pkgver/flit_core

  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # installing tests to a subdir of your project might not conflict the toplevel, but
  # don't do it anyway...
  rm -r "$pkgdir"/usr/lib/python*/site-packages/flit_core/tests/
}