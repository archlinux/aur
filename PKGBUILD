# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>
# Maintainer: nomisge <nomisge @ live . de>

_name=gaphor
pkgname=python-${_name}
pkgver=2.17.0
pkgrel=2
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('Apache')
depends=(
	'gtksourceview4'
	'python-darkdetect'
	'python-gaphas'
	'python-generic'
	'python-jedi'
	'python-tinycss2'
	'python-typing_extensions'
	'python-better-exceptions'
	'python-pydot'
)
makedepends=(
	'gendesk'
	'python-build'
	'python-installer'
	'python-poetry-core'
)
checkdepends=(
	'python-hypothesis'
	'python-pytest'
	'python-pytest-mock'
	'python-sphinx'
	'python-xdoctest'
	'python-pytest-archon'
	'xorg-server-xvfb'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c098fabf3fa7ccf6ea2408888667e8caeb34608c40c69ba57ea217020277c787')

build() {
	cd "${_name}-${pkgver}"
	python po/build-babel.py
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
#	xvfb-run --auto-servernum python -m pytest -k 'not' tests/
	xvfb-run --auto-servernum python -m pytest -s tests/
}

prepare() {
	gendesk -f -n --pkgname="$_name" --pkgdesc="$pkgdesc" --icon='org.gaphor.Gaphor' --categories='Development' PKGBUILD
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/${_name}-${pkgver}/logos/org.gaphor.Gaphor.svg" "$pkgdir"/usr/share/pixmaps/org.gaphor.Gaphor.svg
}
