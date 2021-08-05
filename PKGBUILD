# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pyname=agate-sql
pkgname=python-$_pyname
pkgver=0.5.7
pkgrel=3
pkgdesc='Adds SQL read/write support to agate'
arch=(any)
url="https://$_pyname.readthedocs.org"
license=(MIT)
_pydeps=('agate>=1.5.0'
         sqlalchemy
         sphinx_rtd_theme)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools
             python-sphinx)
checkdepends=(python-crate
              python-geojson
              python-pytest)
_archive="$_pyname-$pkgver"
source=("$_archive.tar.gz::https://github.com/wireservice/$_pyname/archive/$pkgver.tar.gz")
sha256sums=('a324a4831b7b30d6a08237a79f873591b9353ebeb4255a9eca023d4a795dc634')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
	python setup.py build_sphinx
	_rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
	rm -rvf build/sphinx/html/_static
	ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" build/sphinx/html/_static
}

check() {
	cd "$_archive"
	# Upstream Issue: https://github.com/wireservice/agate-sql/issues/35
	pytest tests ||:
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -dm0755 "$pkgdir/usr/share/doc/"
	cp -rv build/sphinx/html "$pkgdir/usr/share/doc/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
