# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.24.3
pkgrel=1
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-httpx python-packaging)
makedepends=(python-build python-poetry-core)
checkdepends=(python-poetry git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('6634d4c0ab7e73451042bb637c58bb1aad12262c7000021303991641005cd47615b687b6591a18d6d585392ab4563b406c94fb0e3c073738549d8b3391202cc6')

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
