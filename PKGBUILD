# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-laspy
_pkg="${pkgname#python-}"
pkgdesc="Pythonic interface for .LAS LIDAR files"
url="https://github.com/laspy/laspy"
pkgver=2.2.0
_commit=fbb2973
pkgrel=1
arch=('any')
license=('BSD')
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
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" make -C docs man
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/laspy.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
