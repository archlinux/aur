# Maintainer: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
pkgver=2.1.2
pkgrel=3
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-setuptools' 'ipython')
makedepends=('cython')
source=(https://files.pythonhosted.org/packages/14/fc/ecf4e238bb601ff829068e5a72cd1bd67b0ee0ae379db172eb6a0779c6b6/line_profiler-${pkgver}.tar.gz line_profiler.patch)
md5sums=('141cb6996f0e3188ca05bfddcb403e36' 'fd05a4246f3bb741bbf9b51ca3e14d34')

build() {
  cd "${srcdir}"
  patch -s -p0 < line_profiler.patch

  cd "${srcdir}/line_profiler-${pkgver}"
  cython _line_profiler.pyx
  python setup.py build
}

check() {
  cd "${srcdir}/line_profiler-${pkgver}"
  py_ver=$(python -c 'import sys; print("{0.major}.{0.minor}".format(sys.version_info))')
  PYTHONPATH="./build/lib.linux-${CARCH}-${py_ver}" python -m unittest discover -v tests
}

package() {
  cd "${srcdir}/line_profiler-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
