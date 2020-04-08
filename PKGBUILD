# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributor: Andrzej Giniewicz <gginiu at gmail.com>
# Contributor: Sebastien Binet <binet at cern.ch>

pkgname=python2-pytables
pkgver=3.5.2
pkgrel=1
arch=('x86_64')
pkgdesc="A package for managing hierarchical datasets and designed to efficiently and easily cope with extremely large amounts of data"
url="http://www.pytables.org"
license=("BSD")
makedepends=('lzo' 'hdf5' 'python2-numexpr' 'python2-setuptools' 'cython2' 'blosc' 'bzip2')
source=(${pkgname}-${pkgver}::"https://github.com/PyTables/PyTables/archive/v${pkgver}.tar.gz")
sha512sums=('72598482c5824b79a5bd60e5ca544f874936be9ce38de6d8f4297d895635cb2522fe0af07788a3370813a8bf04142edf1503cdef87cf570581da9915ced5ad93')

build() {
  cd "$srcdir"/PyTables-$pkgver
  python2 setup.py build --blosc=/usr --lzo=/usr --hdf5=/usr --bzip2=/usr
}

package_python2-pytables() {
  depends=('lzo' 'hdf5' 'python2-numexpr' 'blosc')

  cd "$srcdir"/PyTables-${pkgver}
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # see FS#36015 and FS#44971
  mv "$pkgdir"/usr/bin/pt2to3{,-2.7}
  mv "$pkgdir"/usr/bin/ptdump{,-2.7}
  mv "$pkgdir"/usr/bin/ptrepack{,-2.7}
  mv "$pkgdir"/usr/bin/pttree{,-2.7}

  # see FS#45975
  _site_packages=`python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
  chmod a+rx "${pkgdir}${_site_packages}"/*.egg-info
  chmod a+r "${pkgdir}${_site_packages}"/*.egg-info/*
}
