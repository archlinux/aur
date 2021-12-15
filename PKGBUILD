# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pyname=agate-dbf
pkgname=python-$_pyname
pkgver=0.2.2
pkgrel=3
pkgdesc='Adds read support for dbf files to agate'
arch=(any)
url="https://$_pyname.readthedocs.org"
license=(MIT)
_pydeps=(agate
         dbfread
         sphinx_rtd_theme)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools
             python-sphinx)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("$_archive.tar.gz::https://github.com/wireservice/$_pyname/archive/$pkgver.tar.gz")
sha256sums=('5b60feb4bbb48dd4dcabef2b0248f2b8d4c3d42d60d50971c8067dbb5b01d5f6')

build() {
	cd "$_archive"
	python setup.py build
	python setup.py build_sphinx
	_rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
	rm -rvf build/sphinx/html/_static
	ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" build/sphinx/html/_static
}

check() {
	cd "$_archive"
	pytest tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -dm0755 "$pkgdir/usr/share/doc/"
	cp -rv build/sphinx/html "$pkgdir/usr/share/doc/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
