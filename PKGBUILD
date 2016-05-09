# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgbase=python-h5py-openmpi
pkgname=(python-h5py-openmpi python2-h5py-openmpi)
pkgver=2.6.0
pkgrel=2
pkgdesc="General-purpose Python bindings for the HDF5 library - OpenMPI version"
url="http://www.h5py.org/"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('cython' 'cython2' 'hdf5-openmpi' 'python-numpy' 'python2-numpy' 'python-six' 'python2-six' 'python-mpi4py' 'python2-mpi4py')
source=("https://pypi.python.org/packages/source/h/h5py/h5py-$pkgver.tar.gz"
	DOCS_LICENSE.txt)
sha256sums=('b2afc35430d5e4c3435c996e4f4ea2aba1ea5610e2d2f46c9cae9f785e33c435'
            '9a1e349d9e7513d2f7149b5e4f563c296ee32f60a6bd60b7e966c6140f68279d')

prepare() {
  cp -a h5py-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/h5py-$pkgver
  export CC=mpicc
  python setup.py configure --mpi 
  python setup.py build

  cd "$srcdir"/h5py-$pkgver-py2
  python2 setup.py configure --mpi
  python2 setup.py build
}

check() {
  cd "$srcdir"/h5py-$pkgver
  python setup.py test

  cd "$srcdir"/h5py-$pkgver-py2
  python2 setup.py test
}

package_python-h5py-openmpi() {
  depends=('hdf5-openmpi' 'python-numpy' 'python-six' 'cython' 'python-mpi4py')
  conflicts=('python-h5py')
  provides=('python-h5py')
  cd "$srcdir"/h5py-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1

  install -D "$srcdir/DOCS_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LI\
CENSE"

}

package_python2-h5py-openmpi() {
  depends=('hdf5-openmpi' 'python2-numpy' 'python2-six' 'cython2' 'python2-mpi4py')
  conflicts=('python2-h5py')
  provides=('python2-h5py')

  cd "$srcdir"/h5py-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1

  install -D "$srcdir/DOCS_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LI\
CENSE"

}
