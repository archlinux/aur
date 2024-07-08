# Contributor:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-pytest-mock'
# Do NOT update. 3.0.0 dropped support for Python 2
pkgver=2.0.0
pkgrel=7
pkgdesc='Pytest wrapper for the mock module (legacy Python 2 version)'
arch=('any')
license=('MIT')
url="https://pypi.org/project/pytest-mock/${pkgver}"
depends=(
  'python2'
  'python2-mock'
  'python2-pytest'
)
makedepends=('python2-setuptools-scm')
source=("pytest-mock-${pkgver}.tar.gz::https://github.com/pytest-dev/pytest-mock/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('38f34850ee0303617470c52f83ce0ce0e2b9d4b53ff504a065a1eebca169a85e3d53b989d8193a37eae3ac0b352591bc435c1a3da2fd6e608af7d6b04adf04dc')

# setuptools-scm won't find version from git tag when source is a tarball
export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

build() {
  cd "pytest-mock-${pkgver}"
  python2 setup.py build
}

# Test fail with "fixture 'mocker' not found" errors. They can be resolved by installing this very
# package, but pytest2 somehow doesn't find it during the initial build despite setting PYTHONPATH.
#
#check() {
#  cd "pytest-mock-${pkgver}"
#  (
#    echo '-- Using LC_ALL=C.UTF-8 locale to enforce UTF-8 filesystem encoding during testing'
#    export LC_ALL=C.UTF-8
#
#    echo "-- Using PYTHONDONTWRITEBYTECODE=1 to disable bytecode compilaion during testing"
#    export PYTHONDONTWRITEBYTECODE=1
#
#    export PYTHONPATH="${PWD}/build/lib${PYTHON2PATH:+:${PYTHON2PATH}}"
#    echo "-- Using PYTHONPATH=${PYTHONPATH}"
#
#    echo
#
#    # The test_assert* test fail for unknown reasons.
#    pytest2 tests --assert=plain --cache-clear -r a --verbose -k 'not test_assert'
#  )
#}

package() {
  cd "pytest-mock-${pkgver}"
  python2 setup.py install --force --root="${pkgdir}" --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
