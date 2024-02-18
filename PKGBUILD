# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>
# Maintainer: nomisge <nomisge @ live . de>

_name=gaphor
pkgname=python-${_name}
pkgver=2.24.0
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
#	'python-typing_extensions'
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
#	'python-babel-glade'
	'python-xdoctest'
	'xorg-server-xvfb'
)
provides=("${_name}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e20f32514c2db6c677206584087c908163f9bd348176b2cfe5dd04880f977e34')

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
	python -m pytest -s tests
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
