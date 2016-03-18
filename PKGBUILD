# $Id: PKGBUILD 243119 2015-08-08 03:48:29Z fyan $
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pypy-setuptools
pkgname=('pypy3-setuptools' 'pypy-setuptools')
pkgver=20.3.1
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
makedepends=('pypy' 'pypy3')
url="http://pypi.python.org/pypi/setuptools"
source=("https://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz")
sha512sums=('694258290c27cc2edbc83958de5ea4d8ebd3f96a3708012260438188fc4fd3b30a427ef87bfd418a188a74077acefb9d6e50bcf189c98a9380277f0087cce83b')

prepare() {
  cp -a setuptools-${pkgver}{,-pypy}

  cd "${srcdir}"/setuptools-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy3|" setuptools/command/easy_install.py

  cd "${srcdir}"/setuptools-${pkgver}-pypy
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy|" setuptools/command/easy_install.py
}

# Rename the following function to check() to enable checking
_check() {
  # Workaround UTF-8 tests by setting LC_CTYPE

  # Check pypy3 module
  cd "${srcdir}"/setuptools-${pkgver}
  LC_CTYPE=en_US.utf8 pypy3 setup.py ptr

  # Check pypy2 module
  cd "${srcdir}"/setuptools-${pkgver}-pypy
  LC_CTYPE=en_US.utf8 pypy setup.py ptr
}

package_pypy3-setuptools() {
  depends=('pypy3')
  provides=('pypy3-distribute')
  replaces=('pypy3-distribute')

  cd "${srcdir}/setuptools-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
}
 
package_pypy-setuptools() {
  depends=('pypy')
  provides=('pypy-distribute' 'setuptools')
  replaces=('pypy-distribute' 'setuptools')

  cd "${srcdir}/setuptools-${pkgver}-pypy"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
}
