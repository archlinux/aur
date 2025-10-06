# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=htmldate
pkgname=python-htmldate
pkgver=1.9.3
pkgrel=1
pkgdesc="Fast and robust date extraction from web pages"
arch=('any')
url="https://github.com/adbar/${_name}"
license=('Apache-2.0')
depends=('python-charset-normalizer' 'python-dateparser' 'python-lxml' 'python-dateutil' 'python-urllib3')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/adbar/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('844845c869f18f5cd5817906d059312dfc5f72a528c56c56ba11cd6c287b15f556fd678046f92172ebe72a7c6ab34951eb5966c357cd61a5077f2877eb162a95')
b2sums=('35d52f18dc8981e24a996d01a0ce862c86ad5e4ae2d23271752a263292f4458cea8ab7c332a42769ac8c2a42c6bcb3c203bf051c4df78d771e49e1b242482604')

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
