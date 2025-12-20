# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver=2.0.0
pkgrel=2
pkgdesc="Command-line tool to check C/C++ files for style issues following Google's C++ style guide."
arch=('any')
url='https://github.com/cpplint/cpplint'
license=('custom:BSD3')
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
b2sums=('06fa1ce8d63bd7e9a0d724c4440862f70726b473a67bf64fa4fb19b0dd4187815318f81ff7b8b69ed62b35b524395ea07f22f313faa1a8aaa1b599564b194c05')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # drop leagcy sre_compile: https://github.com/cpplint/cpplint/pull/214
  sed -e '/import sre_compile/d; s/sre_compile/re/g' -i cpplint.py
  # we are not interested in coverage
  sed '/addopts/d' -i setup.cfg
  # pytest-runner is not needed to build
  sed -e '/pytest-runner/d' -i setup.py
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
