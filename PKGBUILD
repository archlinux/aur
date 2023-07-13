# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.5.0
pkgrel=1
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/hyprshade"
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
provides=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6feb9f1f44e66c82f82d9745938b2fdbe9c184e838eeb9cd406dc3a4200bc4ff')

build() {
	cd "$pkgname-$pkgver"
	# NOTE: temporary workaround for https://github.com/python-poetry/poetry/issues/5547
	git init -q 2>&1 >/dev/null
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/hyprshade/shaders/" shaders/*
	install -Dm0644 -t "$pkgdir/usr/share/hyprshade/examples/" examples/*
}
