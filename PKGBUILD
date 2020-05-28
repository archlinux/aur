# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate
pkgname=python-$_pkgname
pkgver=1.6.1
pkgrel=4
pkgdesc='A data analysis library that is optimized for humans instead of machines'
arch=('any')
url='https://agate.readthedocs.org/'
license=('MIT')
depends=(
    'python'
    'python-babel>=2.0'
    'python-isodate>=0.5.4'
    'python-leather>=0.3.2'
    'python-parsedatetime>=2.1'
    'python-pytimeparse>=1.1.5'
    'python-six>=1.9.0'
    'python-slugify>=1.2.1'
    'python-sphinx_rtd_theme>=0.1.6'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
  )
checkdepends=(
    'python-cssselect'
  )
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wireservice/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('0397d3dcc6ae78b8289294b3bca15b2a7328b9015aed8841bc650700fe2a6cad')

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
