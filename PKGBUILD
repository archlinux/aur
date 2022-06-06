# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-lagom
_pkg="${pkgname#python-}"
pkgver=1.7.1
pkgrel=1
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
sha256sums=('c755584dd8b3868f5b29e493e9ce6cf1d5e10280d3e18194cfcc35982b6e4cc8')

build() {
	cd "$_pkg-$pkgver"
	export PYTHONPATH="$PWD"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x -m 'not benchmarking' --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
