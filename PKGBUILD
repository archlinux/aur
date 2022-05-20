# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
pkgver=0.12.5
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
  $pkgname-0.12.5-devendor.patch
)
sha512sums=('3a9f5bf277077fc57c4bdfdd87ed141689a85e1c264f4b4cc8a265e0b93d5cb3b012194c3753c9ceda7069eeb6eb1278154efc61c74549c7e075bacf820336c3'
            '0dcd97be55c121d752fff4574ae3d522f5fb0d1663466a998d03d18963142cbd6d65063f214f4efb45334d78f4d74eb4f9bc7fccdefe40d036d9fa52d74c23ae')
b2sums=('d6c1a94a7b1a75e71f5f3ca5e8f81c53b5bc2ef03d7a333b252b4575d2fc158909cca5f17e8b224b76a9dfd8f3ee1771b96a53959bde90100593a19c9665a3e1'
        'dedb122592daeb10070fa3c1d94ffd30574d1870f72675285a3456ef033ce54d518c981c38e256c74af76f9120a6f669effa2d719d249e802af472b5c8f42174')

prepare() {
  cd $_name-$pkgver
  # remove vendoring of python-boolean.py, python-cerberus,
  # python-license-expression, python-packaging, python-pyparsing,
  # python-tomli, python-tomli-w
  patch -Np1 -i ../$pkgname-0.12.5-devendor.patch
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
