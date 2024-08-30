# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>
# Maintainer: nomisge <nomisge @ live . de>

_name=gaphas
pkgname=python-${_name}
pkgver=4.1.1
pkgrel=1
pkgdesc="Diagramming widget library for Python"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('Apache')
depends=(
	'gtk4'
	'python-gobject'
	'python-cairo'
	'python-importlib-metadata'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry'
	'python-poetry-core'
)
checkdepends=(
	'xorg-server-xvfb'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9f1f72ae3bd9912acb22a42f785b8b390bc41db1b4b06a7bdc975713e869120d')

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
	poetry config virtualenvs.in-project true --local
	poetry install
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	poetry build
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
#	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	export TEST_GTK_VERSION='4.0'
	xvfb-run --auto-servernum poetry run pytest -s tests
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
