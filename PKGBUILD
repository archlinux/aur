# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-flaky'
_name="${pkgname#python2-}"
pkgver=3.7.0
pkgrel=4
pkgdesc='Plugin for nose or py.test that automatically reruns flaky tests'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=(
  'python2-genty'
  'python2-mock'
  'python2-nose'
  'python2-pytest'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/box/${_name}/archive/v${pkgver}.tar.gz")
b2sums=('4e4c9fcb0bb1dc80aa9854e0be0cac39ef45a897f17991e7579714e9430a5b8b8cef2172de04728f550c30eb676586bae193d99830aca60b5603319e19ca840d')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  # Hack entry points for testing by installing the module in a temp dir

  cd "${_tarname}"
  python2 setup.py install --root="${PWD}/tmp_install" --optimize=1
  (
    export PYTHONPATH="${PWD}/tmp_install/usr/lib/python2.7/site-packages:${PYTHONPATH}"
    nosetests2 --with-flaky --exclude='test_nose_options_example' test/test_nose/
    py.test2 -k 'example and not options' --doctest-modules test/test_pytest/
    py.test2 -p no:flaky test/test_pytest/test_flaky_pytest_plugin.py
    nosetests2 --with-flaky --force-flaky --max-runs 2 test/test_nose/test_nose_options_example.py
    py.test2 --force-flaky --max-runs 2 test/test_pytest/test_pytest_options_example.py
  )
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
