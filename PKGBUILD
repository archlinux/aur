# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=datrie
pkgbase=python-datrie
pkgname=(python-datrie python2-datrie)
pkgver=0.7.1
pkgrel=2
pkgdesc="Super-fast, efficiently stored Trie for Python"
arch=('x86_64')
url="https://github.com/pytries/datrie"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'cython')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-hypothesis' 'python2-hypothesis')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('9dd76a0240f0b890a7802463072ee14fb93baf94e009afe9476997200c17be9c94d08339ac85051f9c9a0b47c800d9804665484b6ecfb81305a183c38fd0d300')

prepare() {
  rm -rf "${_name}-${pkgver}-py2" # Tests fail if we keep the cache
  cp -a "${_name}-${pkgver}"{,-py2}
}

build() {
  msg2 "Building python-${_name} ${pkgver}"
  cd "${srcdir}/${_name}-${pkgver}"
  ./update_c.sh
  python setup.py build

  msg2 "Building python2-${_name} ${pkgver}"
  cd "${srcdir}/${_name}-${pkgver}-py2"
  ./update_c.sh
  python2 setup.py build
}

check() {
  msg2 "Running tests on python-${_name} ${pkgver}"
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py pytest

  msg2 "Running tests on python2-${_name} ${pkgver}"
  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py pytest
}

package_python-datrie() {
  depends=('python')

  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-datrie() {
  depends=('python2')

  cd "${_name}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
