# Maintainer: gilcu3

_pkgname=py_ecc
pkgname=python-$_pkgname
pkgdesc="Elliptic curve crypto in python including secp256k1, alt_bn128, and bls12_381."
_pkgver=8.0.0-beta.1
pkgver=${_pkgver//-/_}
pkgrel=1
arch=(any)
url="https://github.com/ethereum/py_ecc"
license=('MIT')
depends=(python python-eth-typing python-eth-utils)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=($url/archive/refs/tags/v$_pkgver.tar.gz)
sha256sums=('eb6628157f6e028b8d4409744d5f144f97a6c38f4daa80af50adecbeff7cefa0')

build() {
  cd $_pkgname-$_pkgver
  python -m build --wheel --no-isolation
}

check(){
  cd $_pkgname-$_pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vv --showlocals tests/
}

package() {
  cd $_pkgname-$_pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
