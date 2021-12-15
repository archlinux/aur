# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pyname=agate-sql
pkgname=python-$_pyname
pkgver=0.5.8
pkgrel=2
pkgdesc='Adds SQL read/write support to agate'
arch=(any)
url="https://$_pyname.readthedocs.org"
license=(MIT)
_pydeps=(agate
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
sha256sums=('2fa8786f7fb05be237ad8366cd9d13231957bcb7d011ef93563244f81f239410')

build() {
	cd "$_archive"
	python setup.py build
	python setup.py build_sphinx
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rvf build/sphinx/html/_static
	ln -svf "$site_packages/sphinx_rtd_theme/static" build/sphinx/html/_static
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
