# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.9.2
pkgrel=1
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
sha256sums=('cf8d80f6fe9aaa66ce5b3bc72c1be5cb8f26b6f8326580b2e1b813eaf36febc5')

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
