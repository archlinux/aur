# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.26.0
pkgrel=1
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-httpx python-packaging)
makedepends=(python-build python-poetry-core)
checkdepends=(python-poetry git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('da07451cd9604da5ef2533c38e9297327e15ec555eed467d35eb386752a8dd9b8cd22d311106fe13bb61139b4d763a845b900b7b68ec654dd853f464eeda4fd5')

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
