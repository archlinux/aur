# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-validate-pyproject
pkgver=0.10.1
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python38-packaging' 'python38-trove-classifiers' 'python38-tomli')
makedepends=('python38-build' 'python38-installer' 'python38-wheel' 'python38-setuptools-scm')
checkdepends=('python38-pytest')
source=("https://github.com/abravalheri/validate-pyproject/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e8212813a782e305b53a89104f16f45b357ab1bbfaf7f6652ac848581102df4bf534d5d408acb8d910ebd7dc4b88e3c9fea3b2dcf41eeb14907cfbc5c9b8ad56')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd validate-pyproject-$pkgver

  # Upstream author only supports VCS builds
  echo "recursive-include src *.template *.json LICENSE LICENSE.*" > MANIFEST.in

  sed -i '/--cov/d' setup.cfg

  # Devendor fastjsonschema
  # Disabled: functional differences due to changes in vendored copy
  # rm -r src/validate_pyproject/_vendor
  # sed -e 's/from validate_pyproject._vendor.fastjsonschema import/from fastjsonschema import/' \
  #     -e 's/from validate_pyproject._vendor import fastjsonschema/import fastjsonschema/' \
  #     -e 's/from .._vendor import fastjsonschema/import fastjsonschema/' \
  #     -e 's/from ._vendor.fastjsonschema import/from fastjsonschema import/' \
  #     -e 's/from ._vendor import fastjsonschema/import fastjsonschema/' \
  #     -i src/validate_pyproject/*.py tests/*.py src/validate_pyproject/pre_compile/*.template src/validate_pyproject/pre_compile/*.py
}

build() {
  cd validate-pyproject-$pkgver
  python3.8 -m build -wn
}

check() {
  cd validate-pyproject-$pkgver
  python3.8 -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests requiring a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
