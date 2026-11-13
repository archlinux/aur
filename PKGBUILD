# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=python-flask-smorest
_name=${pkgname#python-}
pkgver=0.47.0
pkgrel=1
pkgdesc="Flask/Marshmallow-based REST API framework"
arch=(any)
url="https://github.com/marshmallow-code/$_name"
license=(MIT)
depends=(python python-apispec python-click python-flask python-marshmallow python-webargs python-werkzeug)
optdepends=('python-yaml: for the YAML output of flask openapi print')
makedepends=(python-build python-flit-core python-installer)
# flask[async] of upstream's test extra is asgiref, PyYAML is for the YAML output of the spec
checkdepends=(python-asgiref python-packaging python-pytest python-yaml)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('3650f8071488a949988dbe0c188e8c7a070f9c67955aabdde6d1d497946fe76a8ba058915ca2c9a75a9dcb7b33a54dcaed313adf7ab2b896e9cfda28a105e0b4')
b2sums=('d45c3352f9ef349f57f22e67fada3cccb5cf79c5afdaee86e4051a18fdbd4d5649ea969ea462a7d129a2dbe94537301356faf2cf50b6811d7bebc6077857a070')

prepare() {
  cd "$_name-$pkgver" || exit
  # Builds with flit_core 4, which upstream allows since
  # https://github.com/marshmallow-code/flask-smorest/commit/99a7e439bef20dac99b5e4afb5e2ddd020e4b321,
  # not released yet
  sed -i 's/"flit_core<4"/"flit_core<5"/' pyproject.toml
}

build() {
  cd "$_name-$pkgver" || exit
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver" || exit
  # Upstream's tox runs pytest with coverage (pytest-cov), which isn't needed here
  PYTHONPATH="$PWD/src" pytest -p no:cacheprovider tests
}

package() {
  cd "$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst CHANGELOG.rst
}
