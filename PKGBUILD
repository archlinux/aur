# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

## Cannot use libtcod as dependency; statically linked

pkgname=python-tcod
pkgver=13.7.0
pkgrel=1
pkgdesc='High-performance Python port of libtcod'
arch=('x86_64')
url='https://github.com/libtcod/python-tcod'
license=('BSD')
depends=('python-cffi' 'python-numpy' 'python-typing_extensions' 'sdl2')
makedepends=(
	'git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel'
	'python-pytest-runner' 'python-pycparser' 'python-pcpp' 'python-sphinx')
changelog=CHANGELOG.md
source=(
	"$pkgname::git+$url#tag=$pkgver?signed"
	'libtcod::git+https://github.com/libtcod/libtcod#tag=1.21.0?signed')
sha256sums=('SKIP'
            'SKIP')
validpgpkeys=('9EF1E80F3817BC043097A7C15814977902B194CC') # Kyle Benesch @ GitHub

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule.libtcod.url "$srcdir/libtcod"
	git submodule update
}

build() {
	cd "$pkgname"
	python -m build --wheel --skip-dependency-check --no-isolation
	make -C docs man
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" python setup.py pytest
# }

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/python-tcod.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/tcod-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
