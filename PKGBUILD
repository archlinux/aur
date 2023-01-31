# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-gffutils
_pkg="${pkgname#python-}"
pkgver=0.11.1
pkgrel=1
pkgdesc="GFF and GTF file manipulation and interconversion in Python"
arch=('any')
url="https://github.com/daler/gffutils"
license=('MIT')
depends=('python-argcomplete' 'python-argh' 'python-pyfaidx' 'python-simplejson' 'python-six')
optdepends=(
	'bedtools: for genomic interval arithemtic'
	'python-biopython: for sequence manipulation'
	'python-pybedtools: wrapper for bedtools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/$_pkg/$_pkg-$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('ca7bf814d600b389bb2d5c403dd279755118cb1476c19c6f7aecb8c51a84263c'
            '8b8b8e89a6cf1cd74f73f5e5a67053a24bcc681182bc20c30716818fe9243c58')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < 001-setup.py.patch
	sed -i "s/@PKGVER@/$pkgver/" "$_pkg-$pkgver/setup.py"
}

build(){
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
