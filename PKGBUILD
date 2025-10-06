# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=courlan
pkgname=python-courlan
pkgver=1.3.2
pkgrel=1
pkgdesc="Clean, filter and sample URLs to optimize data collection"
arch=('any')
url="https://github.com/adbar/${_name}"
license=('Apache-2.0')
depends=('python-babel' 'python-tld' 'python-urllib3')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel' 'python-pytest')
source=("https://github.com/adbar/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('99044e94548a1a6b6eac54640690e58f9254f389cdf8343d2610762f214246e65190a738d96e63cc7df3f84e4c9962d3f8a46ab0c9d26ddcdf41f3f087788729')
b2sums=('b6d7a679e7ed284efe577e89b4b15341c323af449bb010f51e3ebf22717c3ece403e20dadd4570ea1a8359ee42d5ef2c07b2b3b512f1c38f25f1e6917110c1e9')

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
