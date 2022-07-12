# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-pytest-mock'
_module="${pkgname#python2-}"
pkgver=2.0.0
pkgrel=6
pkgdesc='Pytest wrapper for the mock module (legacy Python 2 version)'
arch=('any')
license=('MIT')
url="https://pypi.org/project/${_module}/${pkgver}"
_repo_owner='pytest-dev'
_repourl="https://github.com/${_repo_owner}/${_module}"
depends=(
  'python2'
  'python2-mock'
  'python2-pytest'
)
makedepends=('python2-setuptools-scm')
_tarname="${_module}-${pkgver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('38f34850ee0303617470c52f83ce0ce0e2b9d4b53ff504a065a1eebca169a85e3d53b989d8193a37eae3ac0b352591bc435c1a3da2fd6e608af7d6b04adf04dc')

# setuptools-scm won't find version from git tag when source is a tarball
export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  (
    echo '-- Using LC_ALL=C.UTF-8 locale to enforce UTF-8 filesystem encoding during testing'
    export LC_ALL=C.UTF-8

    echo "-- Using PYTHONDONTWRITEBYTECODE=1 to disable bytecode compilaion during testing"
    export PYTHONDONTWRITEBYTECODE=1

    export PYTHONPATH="${PWD}/build/lib${PYTHONPATH:+:${PYTHONPATH}}"
    echo "-- Using PYTHONPATH=${PYTHONPATH}"

    echo
    pytest2 tests \
      --assert=plain \
      --cache-clear \
      -r a \
      --verbose
  )
}

package() {
  cd "${_tarname}"
  python2 setup.py install --force --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
