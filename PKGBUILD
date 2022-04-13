# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=gaphor
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=2.9.2.r110.g806a2e9b3
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('x86_64' 'i686')
url="https://github.com/gaphor/${_name}"
license=('Apache')
source=(
	"${_pkgname}::git+${url}.git#branch=main"
)
md5sums=('SKIP')
depends=(
	'gtksourceview4'
	'python-darkdetect'
	'python-gaphas'
	'python-generic'
	'python-jedi'
	'python-tinycss2'
	'python-typing_extensions'
)
makedepends=(
	'git'
	'gendesk'
	'python-build'
	'python-installer'
	'python-poetry-core'
)
optdepends=(
)
checkdepends=(
	'python-hypothesis'
	'python-pytest'
	'python-pytest-mock'
	'python-sphinx'
	'python-xdoctest'
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

prepare() {
	gendesk -f --pkgname="$_name" --pkgdesc="$pkgdesc" --icon='org.gaphor.Gaphor' --categories='Development' PKGBUILD
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/${_pkgname}/logos/org.gaphor.Gaphor.svg" "$pkgdir"/usr/share/pixmaps/org.gaphor.Gaphor.svg
}

# vim: ft=PKGBUILD
