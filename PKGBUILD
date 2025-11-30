# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=lia-web
pkgname=python-$_name
pkgver=0.2.3
pkgrel=1
pkgdesc="A universal web framework adapter for Python that lets you write code once and use it across multiple web frameworks."
arch=('any')
url="https://github.com/strawberry-graphql/strawberry"
license=('MIT')
depends=(
	'python'
	'python-typing_extensions'
)
optdepends=(
	'python-fastapi'
	'python-httpx'
	'python-python-multipart'
	'python-starlette'
	'python-django'
	'python-flask'
	'python-werkzeug'
	'python-sanic'
	'python-aiohttp'
	'python-yarl'
	'python-quart'
	'python-chalice'
	'python-litestar'
	'python-sanic-testing'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-hatchling'
)
checkdepends=(
	'python-pytest'
	'python-pytest-asyncio'
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/patrick91/lia/archive/refs/tags/$pkgver.tar.gz"
)

build() {
	cd "lia-$pkgver"

	python -m build --wheel --no-isolation
}

check() {
	cd "lia-$pkgver"
	#local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

	#PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -P -m pytest \
		-m "not aiohttp" --ignore=tests/request/test_aiohttp.py \
		-m "not chalice" --ignore=tests/request/test_chalice.py \
		-m "not django" --ignore=tests/request/test_django.py \
		-m "not fastapi" --ignore=tests/response/test_fastapi.py --ignore=tests/response/test_response_to_fastapi.py \
		-m "not flask" --ignore=tests/request/test_flask.py \
		-m "not litestar" --ignore=tests/request/test_litestar.py \
		-m "not quart" --ignore=tests/request/test_quart.py \
		-m "not sanic" --ignore=tests/request/test_sanic.py \
		-m "not starlette"

}

package() {
	cd "lia-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('4dcebaf6e57b58d35d9ea7feb9eb834486b501aae484fed4a86fc1b5763af91a')
