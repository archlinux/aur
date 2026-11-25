# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-django-import-export
pkgname=$_pkgname-git
pkgver=4.4.4.r108.g55886bc
pkgrel=1
pkgdesc="Django library for importing and exporting data with admin integration"
arch=("any")
url="https://github.com/django-import-export/django-import-export"
license=("BSD-2-Clause")
depends=(
	"python"
	"python-django>=5.2"
	"python-tablib>=3.7.0"
	"python-diff-match-patch"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-setuptools-scm"
)
checkdepends=(
	"python-chardet"
	"python-pytz"
	"python-psycopg"
	"python-openpyxl"
	"python-odfpy"
	"python-xlrd"
	"python-xlwt"
	"python-pandas"
	"python-yaml"
	"python-tabulate"
)
optdepends=(
	"python-openpyxl: XLSX support"
	"python-odfpy: ODS support"
	"python-xlrd: XLS import support"
	"python-xlwt: XLS export support"
	"python-yaml: YAML support"
	"python-pandas: pandas support"
	"python-tabulate: CLI support"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	git -C "$srcdir/$_pkgname" clean -dfx
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"
	PYTHONPATH="$PWD:$PWD/tests" python tests/manage.py test core
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE AUTHORS -t "$pkgdir/usr/share/licenses/$pkgname/"
}
