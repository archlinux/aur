_pkgname=pyne
pkgname=python-pyne
pkgver=0.7.3
pkgrel=1
pkgdesc='The Nuclear Engineering Toolkit'
arch=('any')
url='https://pyne.io/'
license=('BSD')
makedepends=('gcc-fortran' 'cmake')
depends=('python-numpy' 'python-scipy' 'cython' 'hdf5' 'python-pytables')
source=($pkgname-$pkgver.tar.gz::https://github.com/pyne/pyne/archive/$pkgver.tar.gz
        nuc_data.h5::https://github.com/pyne/data/raw/fd999360f2aa18cf6fee11d785e2dbd248bb6b01/prebuilt_nuc_data.h5
        destdir.patch
	value-error.patch)
sha256sums=('aa7abec24834c3e76acb246b8ea917095d4a30d27e80e3441afe9e089620e177'
            '77a8fbda6db3ed154766f4a7c134651ba710f52d35304f0e456dc6f7e7a69936'
            'dc380f2dcb8ab2f3acef85af7dd155a96f37c99f27889f50d99968655a7b8de5'
            'eddc0b10111eca3d1c8fd997e43af2e7a44f82480672145769f2eab8f67d2520')

prepare() {
	patch -p 1 -d $_pkgname-$pkgver < destdir.patch
	patch -p 1 -d $_pkgname-$pkgver < value-error.patch
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
