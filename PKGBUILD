# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

# The upstream test suite requires an outdated version of python-parsedatetime
# no longer available on Arch. Since the test suite is mostly for upstream
# regressions (not packaging), skipping it is in most users’ best interest.
BUILDENV+=(!check)

_pkgname=agate-excel
pkgname=python-$_pkgname
pkgver=0.2.4
pkgrel=2
pkgdesc='Adds read support for Excel files (xls and xlsx) to agate'
arch=(any)
url='https://agate-excel.readthedocs.org/'
license=(MIT)
depends=(python
         'python-agate>=1.5.0'
         python-olefile
         'python-openpyxl>=2.3.0'
         'python-sphinx_rtd_theme>=0.1.6'
         'python-xlrd>=0.9.4')
makedepends=(python-setuptools
             'python-sphinx>=1.2.2')
checkdepends=(python-nose
              'python-parsedatetime<2.5'
              python-six)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wireservice/agate-excel/archive/${pkgver}.tar.gz")
sha256sums=('5316f158d4df81d5b6e06d4116c1fd47e76ee1f02a6cae116d65fdf6fae532c8')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
	python setup.py build_sphinx
	_rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
	rm -rvf "build/sphinx/html/_static"
	ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "build/sphinx/html/_static"
}

check() {
	cd "$_pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	mkdir -p "$pkgdir/usr/share/doc"
	cp -rv "build/sphinx/html" "$pkgdir/usr/share/doc/$pkgname"
}
