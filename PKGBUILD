# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# shellcheck disable=SC2164,SC2034,SC2154
_pkgauthor=uktrade
_pkgname=stream-unzip
_pkgurl="https://github.com/${_pkgauthor}/${_pkgname}"

pkgname=python-${_pkgname}
pkgver=0.0.101
pkgrel=1
_pkgver="v${pkgver}"

pkgdesc="Python function to stream unzip all the files in a ZIP archive on the fly"
url="https://stream-unzip.docs.trade.gov.uk"

arch=('x86_64')
license=('MIT')

depends=(
  'glibc'
  'libgcc'
  'python'
  'python-pycryptodome'
  'python-stream-inflate'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-maturin'
)
checkdepends=(
  'mypy'
  'python-coverage>=7'
  'python-pytest>=8.3'
  'python-pytest-cov>=5'
  'python-trio'
)
optdepends=(
  'python-trio: alternative async concurrency and I/O implementation'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${_pkgurl}/archive/${_pkgver}.tar.gz"
)

sha256sums=('b6eee2772cd4539fc8086157ac8d983948a2bc528537ae0f0ab9e2a1d80c1fbe')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Change the placeholder to our current version
  sed -i "s/0\.0\.0\.dev0/${pkgver}/g" pyproject.toml
}

# @NOTE: These tests take roughly ~5 minutes to run on the maintainer's
# workstation. This function will remain disabled until upstream provides a way
# to run tests only for the most common usage of the software.
# check() {
#   cd "${_pkgname}-${pkgver}"
#
#   # Test suite requires package to be installed, run in venv
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest -o addopts="" test.py
# }

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CONTRIBUTING.md
}
