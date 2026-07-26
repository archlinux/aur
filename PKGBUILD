# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=htmldate
pkgname=python-htmldate
pkgver=1.10.0
pkgrel=1
pkgdesc="Fast and robust date extraction from web pages"
arch=('any')
url="https://github.com/adbar/${_name}"
license=('Apache-2.0')
depends=('python-charset-normalizer' 'python-dateparser' 'python-lxml' 'python-dateutil' 'python-urllib3')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/adbar/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f07ae96ab1d3d88796777c77ef95713f0d0adc8212c08a2d01ee0912c7894627f631185772ba3aea20532cd2bf09da1808c0c0e6adc72bbc7456a3df5067b945')
b2sums=('66dac2193a9e8f815f1c7c6014b1c824aa5a2603017d68ee7a5fd95e92f1619dfef73e13cf8bc09c691109661c1788bde107e7e6a5f67272d382897c979748a3')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"

	local pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
	local tmpdir="$srcdir/test_dir/"
	python -m installer --destdir="$tmpdir" dist/*.whl

	export PYTHONPATH="$tmpdir/usr/lib/python${pyver}/site-packages:$PYTHONPATH"
	export PATH="$tmpdir/usr/bin:$PATH"
	pytest
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
