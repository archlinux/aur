# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=python-pex
pkgver=2.1.62
pkgrel=1
arch=('any')
pkgdesc='Generates executable Python environments'
url='https://github.com/pantsbuild/pex'
license=('Apache')
depends=('python')
makedepends=('git' 'python-pyproject2setuppy' 'python-flit' 'python-sphinx')
# checkdepends=('python-pytest-runner' 'python-pkginfo')
changelog=CHANGES.rst
provides=('pex')
replaces=('pex')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('A1FE765B15233EAD18FA6ABB93E55CB567B5C626')

build() {
	cd "$pkgname"
	python -m pyproject2setuppy.main build
	cd docs
	make man
}

## 25 minutes to run a test suite lol no thanks
# check() {
# 	cd "$pkgname"
# 	echo ':: Warning: This test will last at least five minutes. You have been warned.'
# 	python setup.py pytest
# }

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m pyproject2setuppy.main install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 docs/_build/man/pex.1 -t "$pkgdir/usr/share/man/man1/"
}
