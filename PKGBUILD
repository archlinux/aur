# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>
# Maintainer: nomisge <nomisge @ live . de>

_name=gaphas
pkgname=python-${_name}
pkgver=3.11.3
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
	'python-poetry-core'
)
checkdepends=(
	'python-pytest'
	'python-sphinx'
	'python-pytest-archon'
	'python-pytest-xvfb'
	'xorg-server-xvfb'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e15b5db6f294fbdaed5abcd1058940542d869a333d4dd45871bb54dbc8739069')

build() {
	cd "${_name}-${pkgver}"
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
#	xvfb-run --auto-servernum python -m pytest tests/
#	export PYTHONPATH=$PYTHONPATH:.
#	pytest
	local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	echo "$python_version"
	python -m pytest -s tests
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
