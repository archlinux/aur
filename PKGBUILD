# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=gaphor
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=2.9.2.r110.g806a2e9b3
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK"
arch=('x86_64' 'i686')
url="https://github.com/gaphor/${_name}"
license=('Apache')
source=(
	"${_pkgname}::git+${url}.git#branch=main"
	"${_name}.xml"
	"org.gaphor.Gaphor.gschema.xml"
)
md5sums=(
'SKIP'
'df4c216ec18314eb1338cc61469f3376'
'88447f02c0ca231b6a65ec90fb21a2fd'
)
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
	'git'
	'gendesk'
	'python-build'
	'python-installer'
	'python-poetry'
	'python-poetry-core'
)
optdepends=(
)
checkdepends=(
	'python-hypothesis'
	'python-pytest'
	'python-pytest-mock'
	'python-pytest-archon'
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

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	if test -d ./dist ; then
		rm -r ./dist
	fi
	gendesk -f -n --pkgname="$_name" --pkgdesc="$pkgdesc" --genericname="UML modelling tool" --mimetypes="application/x-gaphor" --icon='org.gaphor.Gaphor' --categories='Development' PKGBUILD
	echo '* Compiling translations ...'
	python po/build-babel.py &> /dev/null
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." \
		python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_pkgname}"
	wheelpath=$(echo "${srcdir}/${_pkgname}/dist/"*)
	PYTHONPATH="${wheelpath}:${PYTHONPATH}" \
		xvfb-run --auto-servernum pytest \
			--ignore=tests/test_plugins.py
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/${_name}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
	install -Dm644 "$srcdir/org.gaphor.Gaphor.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/org.gaphor.Gaphor.gschema.xml"
	install -Dm644 "$srcdir/${_pkgname}/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/${_pkgname}/data/logos/org.gaphor.Gaphor.svg" "$pkgdir"/usr/share/pixmaps/org.gaphor.Gaphor.svg
}
