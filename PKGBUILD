# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-dbf
pkgname=python-$_pkgname
pkgver=0.2.1
pkgrel=2
pkgdesc="Adds read support for dbf files to agate"
arch=('any')
url='https://agate-dbf.readthedocs.org/'
license=('MIT')
depends=(
    'python'
    'python-agate>=1.5.0'
    'python-dbfread>=2.0.5'
    'python-sphinx_rtd_theme>=0.1.6'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
  )
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wireservice/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('de6ec33fb3e033c4c74376997265e57fbd585195acf0386e28550209bae94a08')

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
