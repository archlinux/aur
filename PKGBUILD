# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: qlonik <volodin.n at gmail dot com>
# Contributor: Mario A. Vazquez <mario_vazq@hotmail.com>

pkgname='python2-pyxdg'
_name="${pkgname#python2-}"
pkgver=0.27
pkgrel=2
pkgdesc='Official freedesktop.org XDG specifications support library'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
provides=("pyxdg=${pkgver}" "python2-xdg=${pkgver}")
conflicts=('pyxdg' 'python2-xdg' 'python2-pyxdg-git')

__tarname_pypi="${_name}-${pkgver}"      # PyPI tarball name
__tarname_git="${_name}-rel-${pkgver}"   # Gitlab/GitHub tarball name
__source_pypi_tar="https://pypi.python.org/packages/source/${_name::1}/${_name}/${__tarname_pypi}.tar.gz"
__source_git_tar="https://gitlab.freedesktop.org/xdg/${_name}/-/archive/rel-${pkgver}/${__tarname_git}.tar.bz2"

_tarname="${__tarname_git}"     # actual tar name to use
source=("${__source_git_tar}")  # actual tar source to use
sha256sums=('dcb774bc2af39118aba56ee9ffbb6c1546bd447456e4555b8c4e1e5f24aa4579')

prepare() {
  echo 'Changing hashbangs in *.py files to refer to python2'
  sed -e 's|#![ ]*/usr/bin/python[^2]\?|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
    cd "${_tarname}"
    python2 setup.py build
}

check() {
    cd "${_tarname}"
    LC_ALL='C.UTF-8' nosetests2 --verbose --with-id
}

package() {
    cd "${_tarname}"
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
