# Maintainer: Jingbei Li <i@jingbei.li>
pkgbase=python-glob2-git
pkgname=(python-glob2-git python2-glob2-git)
_pkgname=python-glob2
pkgver=0.6.r2.g43abdc5
pkgrel=1
pkgdesc="An extended version of Python's builtin glob module that can capture patterns and supports recursive wildcards."
arch=('any')
url="https://github.com/miracle2k/python-glob2"
license=('custom')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/"
  cp -a "${_pkgname}" "${_pkgname}-py2"
  cd "${_pkgname}-py2"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
    -i $(find . -name '*.py')
}

build() {
  msg2 "Building Python 2"
  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py build

  msg2 "Building Python 3"
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package_python2-glob2-git() {
  depends=('python2')
  provides=('python2-glob2')
  conflicts=('python2-glob2')
  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-glob2-git() {
  depends=('python')
  provides=('python-glob2')
  conflicts=('python-glob2')
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
