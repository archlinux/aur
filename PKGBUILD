# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=lean-game-maker
pkgname=$_pkgname-git
pkgver=latest
pkgrel=2
epoch=
pkgdesc='Turns lean code into an interactive browser game'
arch=(any)
url='https://github.com/mpedramfar/Lean-game-maker'
license=(Apache)
depends=(lean-community
         python
         python-fire
         python-jinja
         python-jsonpickle
         python-mistletoe
         python-polib
         python-regex
         python-toml)
makedepends=(gettext
             git
             nodejs
             npm
             python-build
             python-installer
             python-setuptools
             python-wheel)
source=("$_pkgname::git+https://github.com/mpedramfar/Lean-game-maker.git")
sha512sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname/src/interactive_interface"
	export NODE_OPTIONS=--openssl-legacy-provider
	npm install .
	./node_modules/.bin/webpack --mode=production

	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
