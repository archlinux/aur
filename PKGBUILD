# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-scrapelib
pkgver=2.0.5
pkgrel=2
pkgdesc='Library for scraping unreliable pages'
arch=('any')
url='https://github.com/jamesturk/scrapelib'
license=('BSD')
depends=('python>=3.7' 'python-requests')
makedepends=(
	'python-poetry'
	'python-build'
	'python-installer'
	'python-sphinx'
	'python-sphinx_rtd_theme')
checkdepends=('python-pytest' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('82698f7e5ee05363e2cb74d83b2e90f87a0370d1f0073ef12f2b942aba86afae')

build() {
	cd "scrapelib-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ make man
}

check() {
	cd "scrapelib-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "scrapelib-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/scrapelib.1 -t "$pkgdir/usr/share/man/man1/"

	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	local _sitedir="$(python -c 'from site import getsitepackages as g; print(g()[0])')"
	ln -s "$_sitedir/scrapelib-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
