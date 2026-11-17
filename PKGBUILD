# Maintainer: qubeck <qubeck (AT) disroot (DOT) org>
# Contributor: envolution

pkgname=python-tempman
_name=${pkgname#python-}
pkgver=0.1.3
pkgrel=3
pkgdesc='Create and clean up temporary directories'
arch=(any)
url='https://github.com/mwilliamson/python-tempman'
license=(BSD-2-Clause)
depends=(
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=("${_name}::git+${url}.git#tag=${pkgver}"
        nose2pytest.patch)
sha256sums=('5b9eadecadb00a6483775b646d14528fc9e10fc1f75e187bf3b3133d83b49612'
            '368a2f6a97efd8b9658e4261da54dbfcd50f67a74c08f499f5f87dfe499bc26f')

prepare() {
  cd "${_name}"

  patch -Np1 -i ../nose2pytest.patch
  ln -s README.md README
}

build() {
  cd "${_name}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="${PWD}/test-env/bin:${PATH}" \
    test-env/bin/python -P -m pytest -vv tests
}

package() {
  cd "${_name}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
