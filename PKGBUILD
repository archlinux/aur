# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pyname=agate-excel
pkgname=python-$_pyname
pkgver=0.2.5
pkgrel=3
pkgdesc='Adds read support for Excel files (xls and xlsx) to agate'
arch=(any)
url="https://$_pyname.readthedocs.org"
license=(MIT)
_pydeps=(agate
         olefile
         openpyxl
         six
         sphinx_rtd_theme
         xlrd)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools
             python-sphinx)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("$_archive.tar.gz::https://github.com/wireservice/$_pyname/archive/$pkgver.tar.gz")
sha256sums=('aad17edcc99627106e990755cc54e6d8a77452f6f22b30768b35047fbb12c587')

build() {
	cd "$_archive"
	python setup.py build
	python setup.py build_sphinx
	local _rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
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
