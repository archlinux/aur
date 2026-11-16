# Maintainer: qubeck <qubeck (AT) disroot (DOT) org>
# Contributor: envolution

pkgname=python-cobble
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=3
pkgdesc='Python library for easy creation of data objects'
arch=(any)
url='https://github.com/mwilliamson/python-cobble'
license=(BSD-2-Clause)
depends=(
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
)
checkdepends=(
  python-pytest
)
source=("${_name}::git+${url}.git#tag=${pkgver}")
sha256sums=('f5f2fdcb44db24a3f4036d8c0d99d6eff1e7e5501632faad43c2eabaeb2cb966')

prepare() {
  cd "${_name}"

  # CPython 3.14 changed ABCMeta's TypeError wording; these tests compare it verbatim.
  sed -i '1a import pytest' tests.py
  sed -i '/^def test_error_if_visitor_is_missing_methods():/i @pytest.mark.skipif(sys.version_info >= (3, 14), reason="CPython 3.14+ changed ABCMeta TypeError wording")' tests.py
  sed -i '/^def test_sub_sub_classes_are_included_in_abc():/i @pytest.mark.skipif(sys.version_info >= (3, 14), reason="CPython 3.14+ changed ABCMeta TypeError wording")' tests.py
}

build() {
  cd "${_name}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}"

  pytest -vv tests.py
}

package() {
  cd "${_name}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/common/BSD-2-Clause \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
