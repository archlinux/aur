# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.22.0
pkgrel=2
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-httpx python-packaging)
makedepends=(python-build python-poetry-core)
checkdepends=(python-poetry git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('1351a014e3b7f22492e124f3050d1356f16d259555d20502d3fb0f8d583ffb84d91425a229dd6974a75d6d9e45d0e8f192a7b6a36bd41955e6eab4683539bcfb')

prepare () {
	cd "$pkgname-$pkgver"

	# The tests assume that we are using a Git checkout, but they don't
	# mind if we only have a single commit empty commit in the repository.
	git init
	git config user.name 'Mr. Pink'
	git config user.email 'mr@pink.me'
	git -c commit.gpgsign=false commit --allow-empty -m'Dummy commit'

	poetry install
}

build () {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check () {
	cd "$pkgname-$pkgver"
	poetry run pytest -k 'not need_connection' --ignore-glob='*test_lib*'
}

package () {
	cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
