# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jerry73204 <jerry73204 at google gmail>

pkgname=python-asn1
pkgver=2.5.0
pkgrel=1
pkgdesc='ASN.1 encoder/decoder'
arch=('any')
url='https://github.com/andrivet/python-asn1'
license=('MIT')
depends=('python-future')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme')
checkdepends=('python-pytest')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ba174e15974671f2d27474fa0ac53b8ccf920f78ab71302460489cc174effc77')

build() {
	cd "$pkgname-$pkgver"
	export PYTHONPATH="$PWD/src"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ _build/man
}

check() {
	cd "$pkgname-$pkgver"
	pytest tests
}

package_python-asn1() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
