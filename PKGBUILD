# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_pkgname=python-gaphas
pkgname="${_pkgname}-git"
pkgver=3.6.0.r9.gc89cf2c
pkgrel=1
pkgdesc="Diagramming widget library for Python"
arch=('x86_64' 'i686')
url="https://github.com/gaphor/gaphas"
license=('Apache')
source=(
	"${_pkgname}::git+${url}.git#branch=main"
)
md5sums=('SKIP')
depends=(
	'gtk3'
	'python-gobject'
	'python-cairo'
	'python-importlib-metadata'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-poetry-core'
)
optdepends=(
)
checkdepends=(
	'python-pytest'
	'xorg-server-xvfb'
)
provides=(
	"${_pkgname}"
)
conflicts=(
	"${_pkgname}"
)

build() {
	cd "${srcdir}/${_pkgname}"
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_pkgname}"
	xvfb-run --auto-servernum pytest
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ft=PKGBUILD
