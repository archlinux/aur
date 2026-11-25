# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-django-qr-code
pkgname=$_pkgname-git
pkgver=5.0.0.r0.g2803a18
pkgrel=1
pkgdesc="An application that provides tools for displaying QR codes on your Django site"
arch=("any")
url="https://github.com/dprog-philippe-docourt/django-qr-code"
license=("BSD-3-Clause")
depends=(
	"python"
	"python-django>=5.2"
	"python-segno>=1.6"
	"python-pydantic>=2.7"
	"python-pillow"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
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
	python manage.py test qr_code
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
