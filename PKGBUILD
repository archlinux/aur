# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>


pkgbase=python-mdtraj
pkgname=('python2-mdtraj' 'python-mdtraj')
pkgver=1.4.2
pkgrel=1
pkgdesc='A modern, open library for the analysis of molecular dynamics trajectories'
url='http://mdtraj.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=()
optdepends=('python-scipy: For loading and saving AMBER netcdf formatted trajectories.'
            'python-pandas: Some functionality, including mol2 parsing, requires pandas.'
            'python-pytables: Working with HDF5 formatted trajectories requires the PyTables package.')
makedepends=('python2-setuptools' 'python-setuptools')
options=('!libtool')
source=("https://github.com/SimTk/mdtraj/archive/${pkgver}.tar.gz")
sha1sums=('9012aa9233f061b886ed471bb0d780f0c17027d5')

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


package_python2-mdtraj() {
  depends=('python2-numpy' 'cython2')
  msg2 "Installing mdtraj python2"
  cd "${srcdir}/mdtraj-py2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  rm -rf ${pkgdir}/usr/bin 

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

package_python-mdtraj() {
  depends=('python-numpy' 'cython')
  msg2 "Installing mdtraj python3"
  cd "${srcdir}/mdtraj-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}
