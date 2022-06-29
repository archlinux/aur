# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-importlib_resources
_name="${pkgname#python2-}"
pkgver=3.3.1
pkgrel=1
pkgdesc='Read resources from Python packages (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=(
  'python2'
  'python2-contextlib2'
  'python2-pathlib2'
  'python2-singledispatch'
  'python2-typing'
  'python2-zipp'
)
makedepends=(
  'python2-setuptools'
  'python2-setuptools-scm'
)
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('0ed250dbd291947d1a298e89f39afcc477d5a6624770503034b72588601bcc05')

export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

prepare() {
  cd "${_tarname}"

  echo 'Changing hashbangs in *.py files to refer to python2'
  sed -e '1s|#![ ]*/usr/bin/python3\?.*|#!/usr/bin/python2|' \
      -e '1s|#![ ]*/usr/bin/env python3\?.*|#!/usr/bin/env python2|' \
      -e '1s|#![ ]*/bin/env python3\?.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  python2 -m unittest discover -v
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
