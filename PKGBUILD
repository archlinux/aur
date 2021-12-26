# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

## Cannot use libtcod as dependency; statically linked

pkgname=python-tcod
pkgver=13.2.0
pkgrel=1
pkgdesc='High-performance Python port of libtcod'
arch=('x86_64')
url='https://github.com/libtcod/python-tcod'
license=('BSD')
depends=('python-cffi' 'python-numpy' 'python-typing_extensions')
makedepends=(
	'git'
	'python-setuptools'
	'python-pytest-runner'
	'python-pycparser'
	'python-sphinx'
	'sdl2')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver::git+$url#tag=$pkgver?signed"
        'libtcod::git+https://github.com/libtcod/libtcod#tag=1.20.0?signed')
sha256sums=('SKIP'
            'SKIP')
validpgpkeys=('9EF1E80F3817BC043097A7C15814977902B194CC') # Kyle Benesch @ GitHub

prepare() {
	cd "$pkgname-$pkgver"
	git submodule init
	git config submodule.libtcod.url "$srcdir/libtcod"
	git submodule update
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
	cd docs
	make man
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" python setup.py pytest
# }

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/_build/man/python-tcod.1 -t "$pkgdir/usr/share/man/man1/"
}
