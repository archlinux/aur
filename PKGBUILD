# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.21.0
pkgrel=1
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-requests python-ordered-set)
makedepends=(python-build python-poetry-core)
checkdepends=(python-poetry git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('ef1ec8fe2bd5efa84c8122fdb03de75525d051f9e8e5cd3f9b93bdf98a2f937e92e263b8d627e6ed12eed9ef54ddd546a0f7df8099c61cbd626f99efc39b7ec5')

prepare () {
	cd "$pkgname-$pkgver"

	# The tests assume that we are using a Git checkout, but they don't
	# mind if we only have a single commit empty commit in the repository.
	git init
	git config user.name 'Mr. Pink'
	git config user.email 'mr@pink.me'
	git commit --allow-empty -m'Dummy commit'

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
