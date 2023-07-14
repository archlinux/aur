# Maintainer: John Bernard <loqusion@gmail.com>
_pkgname=hyprshade
pkgname=${_pkgname}-git
pkgver=0.5.0.r0.g05d035f
pkgrel=1
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/$_pkgname"
license=('MIT')
_py_deps=(
	more-itertools
	poetry
	typer
)
depends=(
	hyprland
	"${_py_deps[@]/#/python-}"
	util-linux
)
makedepends=(git python-{build,installer})
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/loqusion/${_pkgname}.git)
sha512sums=('SKIP')

prepare() {
	git -C "${srcdir}/${_pkgname}" clean -dfx
}

pkgver() {
	cd $_pkgname
	{
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}
}

build() {
	cd $_pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname
	export PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/shaders/" shaders/*
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/examples/" examples/*
}
