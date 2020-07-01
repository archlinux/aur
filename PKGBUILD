_pkgname=pyne
pkgname=python-pyne
pkgver=0.5.11
pkgrel=1
pkgdesc='The Nuclear Engineering Toolkit'
arch=('any')
url='https://pyne.io/'
license=('BSD')
makedepends=('gcc-fortran' 'cmake')
depends=('python-numpy' 'python-scipy' 'cython' 'hdf5' 'python-pytables')
source=($pkgname-$pkgver.tar.gz::https://github.com/pyne/pyne/archive/$pkgver.tar.gz
        nuc_data.h5::https://github.com/pyne/data/raw/d00f5529bdc8af55638c5d2abb3271c896e08f16/prebuilt_nuc_data.h5
        destdir.patch)
sha256sums=('ba05917b0de446ec520857655e77967a783e3bc723299faf5989f532d6b0647a'
            '8deb26f04ba4bee15355a7443711148b0f7185e7ef4f19ce111b87e85dc29275'
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
