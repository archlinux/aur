# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-lagom
pkgver=1.7.0
pkgrel=3
pkgdesc="Autowiring dependency injection container"
arch=('any')
url="https://github.com/meadsteve/lagom"
license=('MIT')
depends=('python')
makedepends=('python-flit' 'python-build' 'python-installer')
checkdepends=(
	'python-pytest'
	'python-django'
	'python-fastapi'
	'python-flask'
	'python-pydantic'
	'python-starlette')
optdepends=('python-pydantic')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('81fd88ac4f031c166b1c9fa6d4682883571b1a8274949a8dc742b967929006b6')

build() {
	cd "lagom-$pkgver"
	export PYTHONPATH="$PWD"
	python -m build --wheel --no-isolation
}

check() {
	cd "lagom-$pkgver"
	pytest -x -m 'not benchmarking' --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "lagom-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
