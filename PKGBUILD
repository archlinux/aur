# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

# The upstream test suite requires an outdated version of python-parsedatetime
# no longer available on Arch. Since the test suite is mostly for upstream
# regressions (not packaging), skipping it is in most users best interest.
BUILDENV+=('!check')

_pkgname=agate-sql
pkgname=python-$_pkgname
pkgver=0.5.7
pkgrel=2
pkgdesc='Adds SQL read/write support to agate'
arch=(any)
url="https://$_pkgname.readthedocs.org/"
license=(MIT)
depends=(python
         'python-agate>=1.5.0'
         'python-sphinx_rtd_theme>=0.1.6'
         'python-sqlalchemy>=1.0.8')
makedepends=(python-setuptools
             'python-sphinx>=1.2.2')
checkdepends=(python-crate
              python-geojson
              python-nose
              'python-parsedatetime<=2.5')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wireservice/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('a324a4831b7b30d6a08237a79f873591b9353ebeb4255a9eca023d4a795dc634')

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
