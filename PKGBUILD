# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
pkgver=0.12.3
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
  $pkgname-0.12.3-devendor.patch
)
sha512sums=('4da765132f278fec2e1fc6705b00e3f660e030264e0d21be8528dd5389fa488a352e09977e850e1e203c50ff5d5e0798fc685505f5bc15a4cd93b28114601377'
            '177bd0e80b43c8b28c379fb33dd2347fe5d64c7cbc9257b7cf39271e114ad176ddb7f2f4cfae609ccce52f9a10e61a13feb729288ca07c7f6b6a39714232d748')
b2sums=('8f784e7e0314bd91a9dddd096c6d7b456f60f2305741b648cec38cfa8f7b5e027b56dffae3c3b81307e0fe928f85e4acba32d516ce5c37fd6cff4c0c897fef8f'
        '6102f342b461e89362a9cd9e45a8667b6fedad1f1c0362d8bb40a5bb0b141acf439c4a9af4880b869300e55270cc355993c13e33f754e33a174b2fba08cedc03')

prepare() {
  cd $_name-$pkgver
  # remove vendoring of python-boolean.py, python-cerberus,
  # python-license-expression, python-packaging, python-pyparsing,
  # python-tomli, python-tomli-w
  patch -Np1 -i ../$pkgname-0.12.3-devendor.patch
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
