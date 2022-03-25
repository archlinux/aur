# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Joaquin Garmendia <joaquingc123 at gmail dot com>
# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=python-binarytree
pkgver=6.5.1
pkgrel=1
pkgdesc="Python library for studying binary trees"
arch=('any')
url="https://github.com/joowani/binarytree"
license=('MIT')
depends=('python-graphviz' 'python-setuptools-scm')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/binarytree/binarytree-$pkgver.tar.gz")
sha256sums=('cbe4f7c300e357494b392b0dd5dc4dfd9971bb7b430e07ee74a30cab92e4b511')

build() {
	cd "binarytree-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" make -C docs man
}

package() {
	export PYTHONHASHSEED=0
	cd "binarytree-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/binarytree.1 -t "$pkgdir/usr/share/man/man1/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/binarytree-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
