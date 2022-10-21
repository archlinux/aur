# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=gaphas
pkgname=python-${_name}
pkgver=3.8.2
pkgrel=1
pkgdesc="Diagramming widget library for Python"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('Apache')
depends=(
	'gtk3'
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
	'xorg-server-xvfb'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('608b7aa248e477b97197754faced12fb7842bf8a9cdcb108b35d5dc9d367430d')

build() {
	cd "${_name}-${pkgver}"
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	xvfb-run --auto-servernum pytest
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
