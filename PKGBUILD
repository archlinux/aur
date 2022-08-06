# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

## GPG key: https://github.com/jsirois.gpg

pkgname=python-pex
pkgver=2.1.103
pkgrel=1
arch=('any')
pkgdesc='Generates executable Python environments'
url='https://github.com/pantsbuild/pex'
license=('Apache')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core' 'python-sphinx')
# checkdepends=('python-pytest-runner' 'python-pkginfo')
changelog=CHANGES.rst
provides=('pex')
replaces=('pex')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('A1FE765B15233EAD18FA6ABB93E55CB567B5C626')

build() {
	cd "$pkgname"
	## requires python-flit-core>=2,<3
	python -m build --wheel --skip-dependency-check --no-isolation
	make -C docs man
}

## 25 minutes to run a test suite lol no thanks
# check() {
# 	cd "$pkgname"
# 	echo ':: Warning: This test will last at least five minutes. You have been warned.'
# 	python setup.py pytest
# }

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/pex.1 -t "$pkgdir/usr/share/man/man1/"
}
