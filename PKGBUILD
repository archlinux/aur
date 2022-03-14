# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vt-py
pkgver=0.13.2
pkgrel=1
pkgdesc="Official Python client library for VirusTotal's REST API"
arch=('any')
url="https://github.com/virustotal/vt-py"
license=('Apache')
depends=('python-aiohttp')
makedepends=(
	'python-pytest-runner'
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx')
checkdepends=('python-pytest-httpserver' 'python-pytest-asyncio')
provides=('python-virustotal')
replaces=('python-virustotal-api')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c1378a1aaeffee7ef7ad57a460f90563fb57e1d25d7d54dd4398aef1c4dd6867')

build() {
	cd "vt-py-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ sphinx-build -b man source _build
}

check() {
	cd "vt-py-$pkgver"
	pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "vt-py-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/vt-py.1 -t "$pkgdir/usr/share/man/man1/"
}
