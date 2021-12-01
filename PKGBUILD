# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=recommonmark
pkgname=python-$_pyname
pkgver=0.7.1
pkgrel=3
pkgdesc='Markdown parser for docutils'
url="https://$_pyname.readthedocs.io/"
arch=(any)
license=(MIT)
_pydeps=(commonmark
         docutils
         sphinx)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_archive.tar.gz")
sha256sums=('bdb4db649f2222dcd8d2d844f0006b958d627f732415d399791ee436a3686d67')

build() {
	cd "$_archive"
	python setup.py build
	make -C docs text man
}

check() {
	cd "$_archive"
	pytest \
		--deselect tests/test_sphinx.py
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.md
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CHANGELOG.md
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" docs/_build/text/*.txt
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "docs/_build/man/$_pyname.1"
}
