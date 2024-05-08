# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pydicom
pkgver=2.4.4
pkgrel=2
pkgdesc="Pure python package for working with DICOM files"
arch=("any")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'LicenseRef-GDCM')
depends=('python')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-flit-core')
optdepends=('python-numpy: for working with pixel data'
            'python-pillow: for working with compressed image data'
            'gdcm: for working with compressed JPEG, JPEG-LS and JPEG 2000 images'
            'python-pylibjpeg: for working with compressed JPEG images'
            'python-pylibjpeg-openjpeg: for working with compressed JPEG-LS or JPEG 2000 images'
            'python-pylibjpeg-rle: for working with compressed RLE images'
            )
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz"
        "pillow-10.1.patch")
sha256sums=('42c06ed74331174111dd42c89db774a13fc472abe18015f22c5aba80cddb7843'
            '72aa784588b8f8d07142d130e755f223827d9e143e8ba07bc2276b5b0cca7633')

prepare()
{
	cd "$srcdir/pydicom-$pkgver"
	patch --forward --strip=1 --input="$srcdir/pillow-10.1.patch"
}

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
	# CLI tests are broken, skip those
	pytest -k "not TestCLIcall"
}
