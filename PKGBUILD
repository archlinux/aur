# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

_pkgname=python-pybars3
pkgname=$_pkgname-git
pkgver=0.9.7.r6.gbd2ce03
pkgrel=1
pkgdesc="Handlebars.js templating for Python"
arch=("any")
url="https://github.com/wbond/pybars3"
license=("LGPL-3.0-only")
depends=("python" "python-pymeta3")
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
	PYTHONPATH="$PWD" python tests.py
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
