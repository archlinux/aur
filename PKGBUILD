# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-django-weasyprint
pkgname=$_pkgname-git
pkgver=2.6.0.r0.gc88c5ef
pkgrel=1
pkgdesc="A Django class-based view generating PDF responses using WeasyPrint"
arch=("any")
url="https://github.com/fdemmer/django-weasyprint"
license=("Apache-2.0")
depends=("python" "python-django>=3.2" "python-weasyprint>=68")
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
)
checkdepends=("python-pytest")
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
	PYTHONPATH="$PWD/src" python -m pytest
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
