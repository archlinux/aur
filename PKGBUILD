_pkgname=pyne
pkgname=python-pyne
pkgver=0.7.7
pkgrel=1
pkgdesc='The Nuclear Engineering Toolkit'
arch=('any')
url='https://pyne.io/'
license=('BSD')
makedepends=('gcc-fortran' 'cmake')
depends=('python-numpy' 'python-scipy' 'cython' 'hdf5' 'python-pytables')
source=($pkgname-$pkgver.tar.gz::https://github.com/pyne/pyne/archive/$pkgver.tar.gz
        nuc_data.h5::https://github.com/pyne/data/raw/fd999360f2aa18cf6fee11d785e2dbd248bb6b01/prebuilt_nuc_data.h5
        destdir.patch)
sha256sums=('3cc59621825cee343ea764174f974c4aecea91da44e1be99029784c90b8481ea'
            '77a8fbda6db3ed154766f4a7c134651ba710f52d35304f0e456dc6f7e7a69936'
            'dc380f2dcb8ab2f3acef85af7dd155a96f37c99f27889f50d99968655a7b8de5')

prepare() {
	patch -p 1 -d $_pkgname-$pkgver < destdir.patch
}

build() {
	cd $_pkgname-$pkgver
	FFLAGS=-fallow-argument-mismatch python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	DESTDIR="$pkgdir" python setup.py install

	cd -
	SITEPKGDIR=$(python -c 'import site; print(site.getsitepackages()[0])')
	install -Dm644 nuc_data.h5 "$pkgdir$SITEPKGDIR/pyne/nuc_data.h5"
}
