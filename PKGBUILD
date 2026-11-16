# Maintainer: qubeck <qubeck (AT) disroot (DOT) org>
# Contributor: envolution

pkgname=python-mammoth
_name=${pkgname#python-}
pkgver=1.13.0
pkgrel=1
pkgdesc='Convert DOCX documents to clean HTML'
arch=(any)
url='https://github.com/mwilliamson/python-mammoth'
license=(BSD-2-Clause)
depends=(
  python
  python-cobble
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
  python-funk
  python-precisely
  python-spur
  python-tempman
)
source=("${_name}::git+${url}.git#tag=${pkgver}")
sha256sums=('d1fdfa56d939e6662ca1ba4f3f6cb5b063ed83e89f488ce3fd32ebaa533f1a6c')

prepare() {
  cd "${_name}"

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
    test-env/bin/python -P -m pytest
}

package() {
  cd "${_name}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
