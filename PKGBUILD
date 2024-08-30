# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>
# Maintainer: nomisge <nomisge @ live . de>

_name=gaphor
pkgname=python-${_name}
pkgver=2.26.0
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('Apache')
depends=(
	'gtksourceview5'
	'python-cairo'
	'python-gobject'
	'python-gaphas>=4.1.1'
	'python-generic>=1.1.3'
	'python-tinycss2'
	'python-babel'
	'python-jedi'
	'python-better-exceptions'
	'python-pydot'
	'python-pillow'
	'python-defusedxml'
	'python-dulwich'
)
makedepends=(
	'gendesk'
	'python-build'
	'python-installer'
	'python-poetry'
	'python-poetry-core'
)
checkdepends=(
	'xorg-server-xvfb'
)
provides=("${_name}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "${_name}.xml"
	"org.gaphor.Gaphor.gschema.xml")
sha256sums=('2e4ad71f74b960fe9386260beb2e0ecc191b77b30ceb18c5a5a6a28cf7de6e6c'
            'c3868ac8cb77749ef5a5afab722c67b6510f0bfe5a9e1da27ed06c3a8ab444a1'
            'fbf86b3155b0d28158f5c8c29aaa8db897e403f0c6542c331d35a3dfbe0875e1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	echo "Compiling translations ..."
	python po/build-babel.py &> /dev/null
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	echo "Building wheel ..."
	poetry build
#	GIT_CEILING_DIRECTORIES="${PWD}/.." poetry build
#	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	xvfb-run --auto-servernum poetry run pytest -s tests
}

prepare() {
	gendesk -f -n --pkgname="$_name" --pkgdesc="$pkgdesc" --genericname="UML modelling tool" --mimetypes="application/x-gaphor" --icon='org.gaphor.Gaphor' --categories='Development' PKGBUILD
	cd "${srcdir}/${_name}-${pkgver}"
	poetry config virtualenvs.in-project true --local
	poetry install
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
  	install -Dm644 "$srcdir/${_name}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
	install -Dm644 "$srcdir/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/${_name}-${pkgver}/data/logos/org.gaphor.Gaphor.svg" "$pkgdir/usr/share/pixmaps/org.gaphor.Gaphor.svg"
	install -Dm644 "$srcdir/org.gaphor.Gaphor.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/org.gaphor.Gaphor.gschema.xml"
}
