# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver='1.6.1'
pkgrel=4
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
  'python-pytest'
)
provides=('cpplint' 'cpplint-py3')
replaces=('cpplint-py3')
conflicts=('cpplint')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
         https://github.com/cpplint/cpplint/commit/3142f33f.patch)
b2sums=('f3afaba6f8389e8d925e20d94cbcf1451d11b85ca7914b53f966c575a5be7a6b4eb7367f53e549644019ccd1f76eca61415f0c5997842cb5640ab5a7ba00c1de'
        'a632ac1eb87aede1490cb04d8d898821955d37ed60fda80dff9edf5f5008bbff19a0dbfdaa2d191d12c55651d224414e1ba85ef0dffcb60b16e4f04df546bdaa')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # drop leagcy sre_compile: https://github.com/cpplint/cpplint/pull/214
  sed -e '/import sre_compile/d; s/sre_compile/re/g' -i cpplint.py
  # we are not interested in coverage
  sed '/addopts/d' -i setup.cfg
  # pytest-runner is not needed to build
  sed -e '/pytest-runner/d' -i setup.py
  # Fix tests with python 3.12
  patch -p1 -i ../3142f33f.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH=build/lib pytest -vv
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
