# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
pkgver=1.0.0
pkgrel=1
pkgdesc="A PEP 517 backend for PDM that supports PEP 621 metadata"
arch=(any)
url="https://github.com/pdm-project/pdm-pep517"
license=(MIT)
depends=(python-boolean.py python-cerberus python-license-expression python-packaging python-pyparsing python-tomli python-tomli-w)
makedepends=(python-build python-installer)
checkdepends=(git python-pytest python-setuptools)
optdepends=(
  'python-setuptools: for setuptools support'
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-1.0.0-devendor.patch
)
sha512sums=('7dc0d2954d1804f6e013537ef33ef0f90498f4036dcd87d75a33fa443cbe9cfe3432c8d087b84498acbd23391d4aeab0e43c53055d4745ad105e9e6767531aeb'
            '3a37894a930896cd99f526b79645a46e79f8a5d83e3f20493acdbc7be8185ee3e4780ba60fc5b2c97d3d4e1ae4378b49a5d099deabc9b998720f37387ae537af')
b2sums=('8f1165adbc25e9fe2a41d9cd62cf4f5d6f687b0ee8a72e22b3c3664eabcd115176e63556335f4888d61f05b5922bff5a4ba1caf3fe2a61e3c928eb79c3acb9ae'
        'fdf9743958ba8b748dddb432ccad8a2a2c09266a1130bdd259c27e342a4830d215e99bf6e756aa0d3279f26706cce7063d781c489fe1ddb7ea637195a509f454')

prepare() {
  cd $_name-$pkgver
  # remove vendoring of python-boolean.py, python-cerberus,
  # python-license-expression, python-packaging, python-pyparsing,
  # python-tomli, python-tomli-w
  patch -Np1 -i ../$pkgname-1.0.0-devendor.patch
  rm -frv pdm/pep517/_vendor
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver

  # set default git config for test
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
