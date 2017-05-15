# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgbase=python-h5py-openmpi
pkgname=(python-h5py-openmpi python2-h5py-openmpi)
pkgver=2.7.0
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library - OpenMPI version"
url="http://www.h5py.org/"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('cython' 'cython2' 'hdf5-openmpi' 'python-numpy' 'python2-numpy' 'python-six' 'python2-six' 'python-mpi4py' 'python2-mpi4py')
source=("https://github.com/h5py/h5py/archive/${pkgver}.tar.gz"
	DOCS_LICENSE.txt)
sha256sums=('fff3a878c6adfa1b4f5c30b558a295d52dd4fee9174128c626ef416dec1b536b'
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
