# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver=2.0.2
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
b2sums=('1de48a65e4b990cc8be920a10e9db9c4c87fec9940a8be325eed13a2af596944298f718140ba2448843b48d8be67b49f033ffb0e04c95950cf8e2977cccdaccb')

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
