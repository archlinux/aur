# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pydicom
pkgver=1.1.0
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=("x86_64")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'custom')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-numpy: for working with pixel data'
            'python2-pillow: for working with compressed image data')
checkdepends=('python2-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz")
md5sums=('759799fbe1d01d1daadeca649717122b')

build()
{
	cd "$srcdir/pydicom-$pkgver"
	python2 setup.py build
}

package()
{
	cd "$srcdir/pydicom-$pkgver"
	python2 setup.py install --skip-build --root="$pkgdir"/ --optimize=1

	install -D "$srcdir/pydicom-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


check()
{
	cd "$srcdir/pydicom-$pkgver"
	# Test suite has a known issue with Pillow 5 and up
	# See: https://github.com/pydicom/pydicom/issues/663
	# Don't write byte code to prevent a "$srcdir in pkg" error on rebuilds
	PYTHONDONTWRITEBYTECODE=1 \
		pytest2 --deselect=pydicom/tests/test_pillow_pixel_data.py::test_PI_RGB[JPEG_RGB_RGB]
}
