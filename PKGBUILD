# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pydicom
pkgver=2.4.4
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=("any")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-numpy: for working with pixel data'
            'python-pillow: for working with compressed image data'
            'gdcm: for working with compressed JPEG, JPEG-LS and JPEG 2000 images'
            'python-pylibjpeg: for working with compressed JPEG images'
            'python-pylibjpeg-openjpeg: for working with compressed JPEG-LS or JPEG 2000 images'
            'python-pylibjpeg-rle: for working with compressed RLE images'
            )
checkdepends=('python-pytest')
source=(
"$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz"
"pillow-10.1.patch"
)
md5sums=('748bfd7ad12373675c9df4e088f38dd1'
         '837949b3e4505c3fee9c43e8d5665251')

prepare()
{
	cd "$srcdir/pydicom-$pkgver"
	patch --forward --strip=1 --input="$srcdir/pillow-10.1.patch"
}

build()
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py build
}

package()
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py install --skip-build --root="$pkgdir"/ --optimize=1

	install -D "$srcdir/pydicom-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check()
{
	cd "$srcdir/pydicom-$pkgver"
	# CLI tests are broken, skip those
	PYTHONDONTWRITEBYTECODE=1 pytest -k "not TestCLIcall"
}
