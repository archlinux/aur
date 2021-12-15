# Maintainer: Michał Pałubicki <maln0ir@gmx.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=csvkit
pkgver=1.0.6
pkgrel=2
pkgdesc='A suite of utilities for converting to and working with CSV'
arch=(any)
url="https://$pkgname.readthedocs.org"
license=(MIT)
_pydeps=(agate
         agate-dbf
         agate-excel
         agate-sql
         six
         sphinx_rtd_theme)
depends=(python
         "${_pydeps[@]/#/python-}")
optdepends=('ipython: nicer command-line for csvpy utility')
makedepends=(python-setuptools
             python-sphinx)
checkdepends=(python-pytest
              python-pytimeparse)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::https://github.com/wireservice/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ae0d708a5591fc1348b5d1096c7e359c64e0ba8b442eab3121802f62c32f8e4d')

build() {
	cd "$_archive"
	python setup.py build
	python setup.py build_sphinx
	_rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
	rm -rvf "build/sphinx/html/_static"
	ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "build/sphinx/html/_static"
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
