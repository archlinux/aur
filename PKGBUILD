# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pydicom
pkgver=3.0.0
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=("any")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'LicenseRef-GDCM')
depends=('python' 'python-setuptools')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-flit-core')
optdepends=('python-numpy: for working with pixel data'
            'python-pillow: for working with compressed image data'
            'gdcm: for working with compressed JPEG, JPEG-LS and JPEG 2000 images'
            'python-pylibjpeg: for working with compressed JPEG images'
            'python-pylibjpeg-openjpeg: for working with compressed JPEG-LS or JPEG 2000 images'
            'python-pylibjpeg-rle: for working with compressed RLE images'
            )
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz")
sha256sums=('0d21b27ea0110190725ee7cf2ddc29de633e230518b6f859025c1bb063df1b21')

build()
{
	cd "$srcdir/pydicom-$pkgver"
    python -m build --wheel --no-isolation
}

package()
{
	cd "$srcdir/pydicom-$pkgver"
	python -m installer --destdir="$pkgdir"/ dist/*.whl

	install -D "$srcdir/pydicom-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check()
{
	cd "$srcdir/pydicom-$pkgver"

	# Create a venv because software needs to be installed to run tests
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl

	# Skipped tests: have almost correct assertions on exception message
	test-env/bin/python -m pytest -v -k "not test_deepcopy_bufferedreader_raises and not test_no_decoders_raises"
}
