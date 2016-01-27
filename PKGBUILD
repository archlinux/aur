# $Id: PKGBUILD 243119 2015-08-08 03:48:29Z fyan $
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pypy-setuptools
pkgname=('pypy3-setuptools' 'pypy-setuptools')
pkgver=19.6
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
makedepends=('pypy' 'pypy3')
url="http://pypi.python.org/pypi/setuptools"
source=("https://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz"
        # This commit is necessary for the real pypy3 patch
        'pypy3-pre.patch'::'https://bitbucket.org/pypa/setuptools/commits/69acec16260b246c63cba48f80b46895d5b84393/raw/'
        'pypy3.patch'::'https://bitbucket.org/pypa/setuptools/commits/11ef9534d735140144b43d8aff99c7da8f2746bf/raw/')
sha512sums=('79b9a0f595bda16f18997d9937c6bc2e21bb2bb23fcca4be29df2fb71649c5ba973428472e3c795f2a5d6fbcccf1d5f29096a0fb593a4c52fa87b1d003e474da'
            'aa1912f17621c40747d437eb228e6cffaa25f2f77e91d20107efe971a09f74e774b0d8d828570f580a488b92890c021dd2931bb043a5b8a291eaf2dad4c9c016'
            'a05ba834b13682c607f4e8c0247c5bc16e52351a5ca2afa82b6be5c2d8a26ffa2bcb336eb315851229e6eff0145ebd8ec6b870c2f118ee18100dc914b76801d7')

prepare() {
  cp -a setuptools-${pkgver}{,-pypy}

  cd "${srcdir}"/setuptools-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy3|" setuptools/command/easy_install.py
  patch -i ../pypy3-pre.patch -p1 -N -F 0
  patch -i ../pypy3.patch -p1 -N -F 0

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
