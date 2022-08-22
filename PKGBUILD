# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver='1.6.1'
pkgrel=1
pkgdesc="Command-line tool to check C/C++ files for style issues following Google's C++ style guide."
arch=('any')
url='https://github.com/cpplint/cpplint'
license=('custom:BSD3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-pytest-runner' 'python-pip' 'python-wheel')
checkdepends=('python-pytest-flake8' 'python-pylint' 'python-importlib-metadata' 'python-tox' 'python-testfixtures'
              'python-pytest' 'python-pytest-cov')
provides=('cpplint' 'cpplint-py3')
replaces=('cpplint-py3')
conflicts=('cpplint')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('f3afaba6f8389e8d925e20d94cbcf1451d11b85ca7914b53f966c575a5be7a6b4eb7367f53e549644019ccd1f76eca61415f0c5997842cb5640ab5a7ba00c1de')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # for some reason upstream insists on pytest-runner==5.2, remove
  sed -e 's/pytest-runner==.*/pytest-runner"/' -i setup.py
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH=build/lib pytest  
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
