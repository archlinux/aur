# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.9.0
pkgrel=2
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/$pkgname"
license=('MIT')
_py_deps=(
	click
	more-itertools
	poetry
)
depends=(
	hyprland
	"${_py_deps[@]/#/python-}"
	util-linux
)
makedepends=(git python-{build,installer})
provides=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5b1821d33d83cd79ff72a900f7e9a1567b6596fad0fa5425af71d07b36f2410b')

build() {
	cd "$pkgname-$pkgver"
	# NOTE: temporary workaround for https://github.com/python-poetry/poetry/issues/5547
	git init -q 2>&1 >/dev/null
	/usr/bin/python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/"
	/usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/shaders/" shaders/*
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/examples/" examples/*
}
