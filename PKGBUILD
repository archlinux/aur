# $Id: PKGBUILD 243119 2015-08-08 03:48:29Z fyan $
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pypy-setuptools
pkgname=('pypy3-setuptools' 'pypy-setuptools')
pkgver=20.6.6
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
makedepends=('pypy' 'pypy3')
url="http://pypi.python.org/pypi/setuptools"
source=("https://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz")
sha512sums=('033d86cde92afa9ab29f58ce37299123616127f988c0211521aafc198f1146196ca66e67c508dda521876b0122d579cc046780f07edc48dfc4a35967d5c60dd7')

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
