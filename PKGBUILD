# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.6.1
pkgrel=1
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/$pkgname"
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
sha256sums=('980e62f65a2ed08d12eb0d88a25e292fc577c60813c4f38730f035032b5bf2d3')

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
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/shaders/" shaders/*
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/examples/" examples/*
}
