# Maintainer: qubeck <qubeck (AT) disroot (DOT) org>
# Contributor: envolution

pkgname=python-precisely
_name=${pkgname#python-}
pkgver=0.1.9
pkgrel=4
pkgdesc='Matcher library for Python test assertions'
arch=(any)
url='https://github.com/mwilliamson/python-precisely'
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
  python-pyflakes
  python-pyhamcrest
  python-pytest
)
source=("${_name}::git+${url}.git#tag=${pkgver}")
sha256sums=('cc2e2263c730ff57ebb9f255687a4ea237ab61cb923931b59af0f0477d2c266b')

_backports=(
  # Remove unused import
  cae5625d403cd402bfa65e7d2d93a5caab80fdc8

  # Add pyproject.toml
  70dc3371772d0cd80316a61b9269f5977a0c903c

  # Use HTTPS for url in setup.py
  660b7e9831130be255c29079aff06f8080ba814e

  # Replace nose with pytest
  0926df33db76458f530fd800619150ae3a338eab
  013849445ff5f040dc9d6bf444654b105e126796
  b7e4f7c0fa1930ffe981cc5fc965a398e948e12f
)

prepare() {
  cd "${_name}"

  for _c in "${_backports[@]}"; do
    if [[ $_c == *..* ]]; then
      git log --oneline --reverse "${_c}"
    else
      git log --oneline -1 "${_c}"
    fi
    git cherry-pick -n -m1 "${_c}"
  done
}

build() {
  cd "${_name}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}"

  pytest -vv tests
  pyflakes precisely tests
}

package() {
  cd "${_name}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
