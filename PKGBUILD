# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-laspy
pkgdesc="Pythonic interface for .LAS LIDAR files"
url="https://github.com/laspy/laspy"
pkgver=2.1.2
_commit=d5d4361
pkgrel=1
arch=('any')
license=('custom')
depends=('python-numpy')
makedepends=(
	'git'
	'python-m2r2'
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('44B238524D21C5064D7081BD5022EF94BE848C51')

build() {
	cd "$pkgname"
	python -m build --wheel --skip-dependency-check --no-isolation
	cd docs
	PYTHONPATH=../ make man
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 docs/_build/man/laspy.1 -t "$pkgdir/usr/share/man/man1/"
}
