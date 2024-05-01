# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>
# Maintainer: nomisge <nomisge @ live . de>

_name=gaphor
pkgname=python-${_name}
pkgver=2.25.1
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('Apache')
depends=(
	'gtksourceview5'
	'python-gaphas>=4.0.0'
	'python-generic>=1.1.2'
	'python-jedi'
	'python-tinycss2'
	'python-pygit2'
	'python-better-exceptions'
	'python-pydot'
	'python-babel'
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
	'python-pytest-archon'
	'python-pytest-xvfb'
	'python-sphinx'
	'python-xdoctest'
	'xorg-server-xvfb'
	'python-pytest-randomly'
)
provides=("${_name}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('86a73972e90c448ecb08d32a374cbc465b58893a243501be5c8b97bd80df3f7a')

build() {
	cd "${_name}-${pkgver}"
	echo "Compiling translations ..."
	python po/build-babel.py &> /dev/null
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	echo "Building wheel ..."
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	xvfb-run python -m pytest -s tests -p no:ruff -p no:mypy
	#xvfb-run --auto-servernum python -m pytest -s tests
}

prepare() {
	gendesk -f -n --pkgname="$_name" --pkgdesc="$pkgdesc" --icon='org.gaphor.Gaphor' --categories='Development' PKGBUILD
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/${_name}-${pkgver}/data/logos/org.gaphor.Gaphor.svg" "$pkgdir"/usr/share/pixmaps/org.gaphor.Gaphor.svg
}
