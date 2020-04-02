# Maintainer: Michał Pałubicki <maln0ir@gmx.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=csvkit
pkgver=1.0.5
pkgrel=3
pkgdesc='A suite of utilities for converting to and working with CSV'
arch=('any')
url='http://csvkit.readthedocs.org'
license=('MIT')
depends=('python'
         'python-agate-dbf>=0.2.0'
         'python-agate-excel>=0.2.2'
         'python-agate-sql>=0.5.3'
         'python-agate>=1.6.1'
         'python-babel'
         'python-dateutil'
         'python-openpyxl'
         'python-six>=1.6.1'
         'python-sphinx_rtd_theme>=0.1.6'
         'python-sqlalchemy'
         'python-xlrd')
optdepends=('ipython: nicer command-line for csvpy utility')
makedepends=('python-setuptools'
             'python-sphinx>=1.2.2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wireservice/csvkit/archive/$pkgver.tar.gz")
sha256sums=('dc9ca3f05d26ddf8a1243b91354a7e7e1b43bb602bdf98e2c90980b1921f7813')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
    python setup.py build_sphinx
    _rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
    rm -rvf "build/sphinx/html/_static"
    ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "build/sphinx/html/_static"
}

check() {
    cd "$pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir -p "$pkgdir/usr/share/doc"
    cp -rv "build/sphinx/html" "$pkgdir/usr/share/doc/$pkgname"
}
