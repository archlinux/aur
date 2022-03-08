# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname="python-${_pkgname}"
pkgver='1.6.0'
pkgrel=1
pkgdesc="Command-line tool to check C/C++ files for style issues following Google's C++ style guide."
arch=('any')
url='https://github.com/cpplint/cpplint'
license=('custom:BSD3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-pytest-runner' 'python-pip' 'python-wheel')
checkdepends=('python-flake8' 'python-pylint' 'python-importlib-metadata' 'python-tox' 'python-testfixtures')
provides=('cpplint' 'cpplint-py3')
replaces=('cpplint-py3')
conflicts=('cpplint')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ddc50661b62103376675d6e4bcaa85745fa523343c3d93a1f774685005f9afb3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # for some reason upstream insists on pytest-runner==5.2, remove
  sed -e 's/pytest-runner==.*/pytest-runner"/' -i setup.py
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # bug in pytest prevents testing - https://github.com/pytest-dev/pytest/issues/1888
  # python -m venv --system-site-packages test-env
  # test-env/bin/python -m pip install -r test-requirements
  # test-env/bin/python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
