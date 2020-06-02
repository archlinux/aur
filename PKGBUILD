# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# based on python-solid package

pkgname=python-solid-git
_pkgname=solidpython
pkgver=r476.bb341d7
_pkgver=0.4.9
pkgrel=2
pkgdesc="SolidPython: OpenSCAD for Python"
arch=('any')
license=('LGPL2.1')
url="https://github.com/SolidCode/SolidPython"
makedepends=("python-setuptools" "python-poetry")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('python-euclid3' 'python-pypng' 'python-prettytable' 'python-regex')
source=("git+https://github.com/SolidCode/${_pkgname}.git")
md5sums=(SKIP)

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  poetry config --local virtualenvs.create false
  poetry config --local cache-dir "${srcdir}/${_pkgname}/.poetry-cache"
}

build() {
  cd ${_pkgname}
  poetry build --format sdist
  tar xvf dist/${_pkgname}-${_pkgver}.tar.gz

  cd ${_pkgname}-${_pkgver}/
  python setup.py build
}

package() {
  cd ${_pkgname}/${_pkgname}-${_pkgver}/
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
