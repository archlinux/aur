# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-lagom
_pkg="${pkgname#python-}"
pkgver=2.7.7
pkgrel=1
pkgdesc="Autowiring dependency injection container"
arch=('any')
url="https://github.com/meadsteve/lagom"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'mypy' 'python-setuptools' 'python-wheel')
checkdepends=(
	'python-django'
	'python-fastapi'
	'python-flask'
	'python-httpx'
	'python-pydantic'
	'python-pytest'
    'python-pytest-asyncio'
	'python-starlette')
optdepends=('python-pydantic')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8a9fd4ab9f58150c2673ec92c36b704b6f1bf4180af66dfbc131c4cd53625a72')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i 's/mypy==/mypy>=/' pyproject.toml
}

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
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
