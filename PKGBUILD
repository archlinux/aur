# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.24.1
pkgrel=1
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-httpx python-packaging)
makedepends=(python-build python-poetry-core)
checkdepends=(python-poetry git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('4af1167b14a9cf75688265571ee5da5e3feeaec884a6d40cb5000a9db0dc98c1f6ae70710cf1a3d44ee7e564af8a14b8766b34ee99c5e0c00c84d2d0b0a095c9')

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
