# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.9.3
pkgrel=1
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/$pkgname"
license=('MIT')
_py_deps=(
	click
	more-itertools
)
depends=(
	hyprland
	"${_py_deps[@]/#/python-}"
	util-linux
)
makedepends=(git python-{build,installer,pdm-backend})
provides=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9da46b90e979c867201086f7cc2bea7dd0c26a9f7914183e40ef7ef530821d96')

build() {
	cd "$pkgname-$pkgver"
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
