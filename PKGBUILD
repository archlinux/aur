# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vt-py
_pkg="${pkgname#python-}"
pkgver=0.16.0
pkgrel=1
pkgdesc="Official Python client library for VirusTotal's REST API"
arch=('any')
url="https://github.com/virustotal/vt-py"
license=('Apache')
depends=('python-aiohttp')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-httpserver')
provides=('python-virustotal')
replaces=('python-virustotal-api')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('96dfb132aab1f95a71bf9c8413edf989c4eb105a38a8339348c28ccb324f38fb')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/setup_requires/d' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" sphinx-build -b man docs/source _build
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "_build/$_pkg.1" -t "$pkgdir/usr/share/man/man1/"
}
