# $Id: PKGBUILD 243119 2015-08-08 03:48:29Z fyan $
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pypy-setuptools
pkgname=('pypy3-setuptools' 'pypy-setuptools')
pkgver=19.3
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/setuptools"
makedepends=('pypy3' 'pypy')
source=("https://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz")
sha512sums=('dabc7e77ddbb2b99ae0d6f383c279a7005148bea1511048bdc2a34fc0bb324d858b71bcf9a4432b9221d4a29c7d686b19b0dddb5dccd71fe54b6cc7b1f4d0c35')

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

check() {
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
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1 --skip-build
}
 
package_pypy-setuptools() {
  depends=('pypy')
  provides=('pypy-distribute' 'setuptools')
  replaces=('pypy-distribute' 'setuptools')

  cd "${srcdir}/setuptools-${pkgver}-pypy"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1 --skip-build
}
