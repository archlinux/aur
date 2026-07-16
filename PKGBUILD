# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=courlan
pkgname=python-courlan
pkgver=1.4.0
pkgrel=1
pkgdesc="Clean, filter and sample URLs to optimize data collection"
arch=('any')
url="https://github.com/adbar/${_name}"
license=('Apache-2.0')
depends=('python-babel' 'python-tld' 'python-urllib3')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-httpserver')
source=("https://github.com/adbar/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('320ada5aff819efce7ac51e3ab11dfc3255f13fed54b817844922e28743d245f30b3370c30b436c6fda8f141e60b4d1ccaa0cf7c3cb0a769e4afe1cfa88cf0b7')
b2sums=('9d2baa9f50efbcdf8310510f719a7f5e97f16e7631d6eb753888ba7b78aeda0bdfdfd0bff73b236a929f1d6d5861c739e9156846ce06b0488847f1c9ce7c35d1')

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
	pytest -k "not test_urlcheck_redirects"
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
