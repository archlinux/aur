# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pyname=agate-sql
pkgname=python-$_pyname
pkgver=0.5.7
pkgrel=4
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
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rvf build/sphinx/html/_static
	ln -svf "$site_packages/sphinx_rtd_theme/static" build/sphinx/html/_static
}

check() {
	cd "$_archive"
	# Upstream Issue: https://github.com/wireservice/agate-sql/issues/35
	pytest tests \
		--deselect tests/test_agatesql.py::TestSQL::test_to_sql_create_statement_with_schema
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -dm0755 "$pkgdir/usr/share/doc/"
	cp -rv build/sphinx/html "$pkgdir/usr/share/doc/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
