pkgbase=python-pyfmi
pkgname=('python-pyfmi' 'python2-pyfmi')
pkgver=2.5
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'fmilib' 'cython' 'cython2' 'python-assimulo' 'python2-assimulo' 'python-lxml' 'python2-lxml')
source=("https://pypi.io/packages/source/P/PyFMI/PyFMI-${pkgver}.tar.gz" unzip_dir_encoding_fix.patch)
sha256sums=('f0485f786a40448c8ffb9e2b03a587d84cd1fe403c1056f50ab787de18f8ba0b' SKIP)

prepare() {
  cd "${srcdir}"/PyFMI-${pkgver}
  rm src/pyfmi/*.c

  # bug in https://github.com/modelon/PyFMI/commit/decbb8340620c13c08e2acb5c4ae52ee2008462c
  patch -p1 -i "${srcdir}"/unzip_dir_encoding_fix.patch
}

build() {
  cp -r "${srcdir}"/PyFMI-${pkgver} "${srcdir}"/PyFMI-${pkgver}-py2

  cd "${srcdir}"/PyFMI-${pkgver}
  python setup.py build --fmil-home=/usr/

  cd "${srcdir}"/PyFMI-${pkgver}-py2
  python2 setup.py build --fmil-home=/usr/
}

package_python-pyfmi() {
  depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')

  cd "${srcdir}"/PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}

package_python2-pyfmi() {
  depends=('fmilib' 'python2-scipy' 'python2-lxml' 'python2-assimulo')

  cd "${srcdir}"/PyFMI-${pkgver}
  python2 setup.py install --root=${pkgdir} --fmil-home=/usr/
}

