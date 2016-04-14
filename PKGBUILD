# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>


pkgbase=python-mdtraj
pkgname=('python2-mdtraj' 'python-mdtraj')
pkgver=1.6.1
pkgrel=1
pkgdesc='A modern, open library for the analysis of molecular dynamics trajectories'
url='http://mdtraj.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=()
makedepends=('python2-setuptools' 'python-setuptools' 'cython2' 'cython')
options=('!libtool')
source=("https://github.com/SimTk/mdtraj/archive/${pkgver}.tar.gz")
sha1sums=('bd1ca717595cbbc852d08463e9dbe01a8de9f941')

prepare() {
  cd "$srcdir"
  cp -a mdtraj-${pkgver} mdtraj-py2-${pkgver}
}

build() {
  msg2 "Building mdtraj - Python2"
  cd "${srcdir}/mdtraj-py2-${pkgver}"
  python2 setup.py build

  msg2 "Building mdtraj - Python3"
  cd "${srcdir}/mdtraj-${pkgver}"
  python setup.py build
}

package_python-mdtraj() {
  depends=('python-numpy')
  optdepends=('python-scipy: For loading and saving AMBER netcdf formatted trajectories.'
              'python-pandas: Some functionality, including mol2 parsing, requires pandas.'
              'python-nose: To run tests.'
              'python-scripttest: To run some of the tests with nose "nosetest -v mdtraj".'
              'python-networkx: Required for some of the functions'
              'python-pytables: Working with HDF5 formatted trajectories requires the PyTables package.')
  msg2 "Installing mdtraj python3"
  cd "${srcdir}/mdtraj-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}


package_python2-mdtraj() {
  depends=('python2-numpy')
  optdepends=('python2-scipy: For loading and saving AMBER netcdf formatted trajectories.'
              'python2-pandas: Some functionality, including mol2 parsing, requires pandas.'
              'python2-nose: To run tests.'
              'python2-scripttest: To run some of the tests with nose "nosetest -v mdtraj".'
              'python2-networkx: Required for some of the functions'
              'python2-pytables: Working with HDF5 formatted trajectories requires the PyTables package.')
  msg2 "Installing mdtraj python2"
  cd "${srcdir}/mdtraj-py2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  rm -rf ${pkgdir}/usr/bin 

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

