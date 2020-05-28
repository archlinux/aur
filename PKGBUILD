# Contributor: Michał Pałubicki <maln0ir@gmx.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=agate-sql
pkgname=python-$_pkgname
pkgver=0.5.4
pkgrel=2
pkgdesc='Adds SQL read/write support to agate'
arch=('any')
url='https://agate-sql.readthedocs.org/'
license=('MIT')
depends=(
    'python'
    'python-agate>=1.5.0'
    'python-sphinx_rtd_theme>=0.1.6'
    'python-sqlalchemy>=1.0.8'
  )
optdepends=(
    'python-crate'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
  )
checkdepends=($optdepends)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wireservice/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('15eed2f24972907213809033a5cb138e9299724a638229476e9bd791401c0461')

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
    python setup.py test --test-suite=tests
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir -p "$pkgdir/usr/share/doc"
    cp -rv "build/sphinx/html" "$pkgdir/usr/share/doc/$pkgname"
}
