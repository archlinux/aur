# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=python-pex
pkgver=2.1.59
pkgrel=1
arch=('any')
pkgdesc='Generates executable Python environments'
url='https://github.com/pantsbuild/pex'
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-dephell' 'python-sphinx')
# checkdepends=('python-pytest-runner' 'python-pkginfo')
changelog=CHANGES.rst
provides=('pex')
replaces=('pex')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('A1FE765B15233EAD18FA6ABB93E55CB567B5C626')

prepare() {
	cd "$pkgname"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$pkgname"
	python setup.py build
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
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 docs/_build/man/pex.1 -t "$pkgdir/usr/share/man/man1/"
}
