# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-lagom
pkgver=1.7.0
pkgrel=1
pkgdesc="Autowiring dependency injection container"
arch=('any')
url="https://github.com/meadsteve/lagom"
license=('MIT')
depends=('python>=3.6')
makedepends=('python-setuptools' 'python-dephell')
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

prepare() {
	cd "lagom-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "lagom-$pkgver"
	python setup.py build
}

check() {
	cd "lagom-$pkgver"
	pytest -x -m 'not benchmarking'
}

package() {
	export PYTHONHASHSEED=0
	cd "lagom-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
