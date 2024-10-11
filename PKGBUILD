# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>
# Maintainer: nomisge <nomisge @ live . de>

_name=gaphor
pkgname=python-${_name}
pkgver=2.27.0
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK"
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
conflicts=('python-gaphas>=5.0.0')
makedepends=(
	'gendesk'
	'python-build'
	'python-installer'
	'python-poetry'
	'python-poetry-core'
)
checkdepends=(
	'python-hypothesis'
	'python-pytest'
	'python-pytest-mock'
	'python-pytest-archon'
	'python-sphinx'
	'python-xdoctest'
	'xorg-server-xvfb'
	'python-types-docutils'
)
provides=("${_name}")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"${_name}.xml"
	"org.gaphor.Gaphor.gschema.xml"
)
sha256sums=('a13435cc8833b5e5149bdcf70d82fdb32e5597331ba44669421848809686fdf8'
            'c3868ac8cb77749ef5a5afab722c67b6510f0bfe5a9e1da27ed06c3a8ab444a1'
            'fbf86b3155b0d28158f5c8c29aaa8db897e403f0c6542c331d35a3dfbe0875e1')

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
	# Note: Using poetry within src dir; since otherwise tests won't run on my machine. There seem to be some issues in upstream code, e.g. interfering with my localized system.
	# Using poetry that way is not nice, but system itself is not touched so I don't see any reason not to.
	#  @actionless: You are welcome to change back again and make me wiser, I only commented out the original lines :-)
	poetry config virtualenvs.in-project true --local
	poetry install
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	if test -d ./dist ; then
		rm -r ./dist
	fi
	gendesk -f -n --pkgname="$_name" --pkgdesc="$pkgdesc" --genericname="UML modelling tool" --mimetypes="application/x-gaphor" --icon='org.gaphor.Gaphor' --categories='Development' PKGBUILD
	echo '* Compiling translations ...'
	python po/build-babel.py &> /dev/null

	echo '* Building wheel ...'
	poetry build
#	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
#	# from incorrectly using a parent git checkout info.
#	# https://github.com/pypa/build/issues/384#issuecomment-947675975
#	GIT_CEILING_DIRECTORIES="${PWD}/.." \
#		python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	xvfb-run --auto-servernum poetry run pytest -s tests
#	PYTHONPATH="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-py3-none-any.whl:${PYTHONPATH}" \
#		xvfb-run --auto-servernum pytest \
#			--ignore=tests/test_plugins.py
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/${_name}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
	install -Dm644 "$srcdir/org.gaphor.Gaphor.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/org.gaphor.Gaphor.gschema.xml"
	install -Dm644 "$srcdir/${_name}-${pkgver}/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/${_name}-${pkgver}/data/logos/org.gaphor.Gaphor.svg" "$pkgdir/usr/share/pixmaps/org.gaphor.Gaphor.svg"
}
