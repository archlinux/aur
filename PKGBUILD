# $Id: PKGBUILD 243119 2015-08-08 03:48:29Z fyan $
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pypy-setuptools
pkgname=('pypy3-setuptools' 'pypy-setuptools')
pkgver=18.1
pkgrel=2
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/setuptools"
makedepends=('pypy3' 'pypy')
source=("https://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz")
sha512sums=('1367f3a10c1fef2f8061e430585f1927f6bd7c416e764d65cea1f4255824d549efa77beef8ff784bbd62c307b4b1123502e7b3fd01a243c0cc5b433a841cc8b5')

prepare() {
  cp -a setuptools-${pkgver}{,-pypy}

  cd "${srcdir}"/setuptools-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy3|" setuptools/command/easy_install.py

  cd "${srcdir}"/setuptools-${pkgver}-pypy
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy|" setuptools/command/easy_install.py
}

build() {
  # Build pypy 3 module
  cd "${srcdir}"/setuptools-${pkgver}
  pypy3 setup.py build

  # Build pypy 2 module
  cd "${srcdir}"/setuptools-${pkgver}-pypy
  pypy setup.py build
}

package_pypy3-setuptools() {
  depends=('pypy3')
  provides=('pypy3-distribute')
  replaces=('pypy3-distribute')

  cd "${srcdir}/setuptools-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1 --skip-build
}
 
package_pypy-setuptools() {
  depends=('pypy')
  provides=('pypy-distribute' 'setuptools')
  replaces=('pypy-distribute' 'setuptools')

  cd "${srcdir}/setuptools-${pkgver}-pypy"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1 --skip-build
}
