# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=symbolator
pkgname=$_pkgname-git
pkgver=r60.3f02d90
pkgrel=1
pkgdesc="HDL symbol generator"
arch=("any")
url="https://github.com/hdl/symbolator"
license=("MIT")
depends=(
	"python"
	"python-hdlparse"
	"python-cairo"
	"python-gobject"
	"pango"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
)
optdepends=(
	"python-sphinx: symbolator sphinx extension"
	"python-six: symbolator sphinx extension"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	git -C "$srcdir/$_pkgname" clean -dfx

	cd "$_pkgname"
	# current hdlparse returns an object instead of a string as VHDL data type
	sed -i symbolator.py \
		-e 's/for p in vo\.ports:/for p in list(vo.ports) + list(vo.generics or []):/' \
		-e '/data_type = p\.data_type\.replace/i\
    if not isinstance(p.data_type, str):\
      p.data_type = p.data_type.name + p.data_type.arange'
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
