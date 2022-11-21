# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Chris Warrick <aur@chriswarrick.com>

_pkg=cloudpickle
pkgname=python38-${_pkg}
pkgver=2.1.0
pkgrel=1
pkgdesc="Extended pickling support for Python objects"
arch=(any)
url="https://github.com/cloudpipe/cloudpickle"
license=(BSD)
depends=(python38-setuptools)
checkdepends=(
    python38-pytest
    python38-psutil
    python38-tornado
    python38-numpy
)
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('bb233e876a58491d9590a676f93c7a5473a08f747d5ab9df7f9ce564b3e7938e')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  cd tests/cloudpickle_testpkg
  python3.8 setup.py build
  cd ../../
  PYTHONPATH="${PWD}"/tests/cloudpickle_testpkg/build/lib/ \
  pytest -vl --color=yes -m 'not avoid_ci' \
         --deselect tests/cloudpickle_file_test.py::CloudPickleFileTests::test_pickling_special_file_handles \
         --deselect tests/cloudpickle_test.py::CloudPickleTest::test_pickling_file_handles \
         --deselect tests/cloudpickle_test.py::Protocol2CloudPickleTest::test_pickling_file_handles
}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
