# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-django-tex
pkgname=$_pkgname-git
pkgver=1.1.12.r0.g4abb02b
pkgrel=1
pkgdesc="A simple Django app to render LaTeX templates and compile them into PDF files"
arch=("any")
url="https://github.com/ramibch/django-tex"
license=("MIT")
depends=(
	"python"
	"python-django>=2.2"
	"python-jinja>=2.9.6"
	"texlive-bin"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-setuptools-scm"
)
optdepends=(
	"texlive-binextra: latexmk as LaTeX interpreter"
	"texlive-luatex: lualatex, the default LaTeX interpreter"
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

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
