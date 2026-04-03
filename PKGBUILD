# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver=2.0.1
pkgrel=1
pkgdesc="Command-line tool to check C/C++ files for style issues following Google's C++ style guide."
arch=('any')
url='https://github.com/cpplint/cpplint'
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-testfixtures'
  'python-parameterized'
  'python-pytest'
  'python-pytest-cov'
  'python-pytest-timeout'
)
provides=('cpplint' 'cpplint-py3')
replaces=('cpplint-py3')
conflicts=('cpplint')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('ff7096c5b81be824ff6a79ad5ab5de070bf9da56d3bb9174b81d5a7684ab77669c4de250de902fc9adae90d57e79e9646922fa876e29d978a2307ff88cd11631')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # we are not interested in coverage
  sed '/^addopts = /d' -i pyproject.toml
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH=build/lib PYTHONWARNINGS="ignore::DeprecationWarning" pytest -W ignore::DeprecationWarning -vv
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
