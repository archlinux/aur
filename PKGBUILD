# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Alexander Kurilo <alex@kurilo.me>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Thor K. H. <thor alfakrøll roht dott no>

pkgname=csvkit-git
pkgver=1.0.5.r1.g178eb76
pkgrel=1
pkgdesc='A suite of utilities for converting to and working with CSV'
arch=('any')
url='https://csvkit.readthedocs.org'
license=('MIT')
depends=('python'
         'python-agate-dbf>=0.2.0'
         'python-agate-excel>=0.2.2'
         'python-agate-sql>=0.5.3'
         'python-agate>=1.6.1'
         'python-babel'
         'python-dateutil'
         'python-openpyxl'
         'python-six'
         'python-sphinx_rtd_theme'
         'python-sqlalchemy'
         'python-xlrd')
optdepends=('ipython: nicer command-line for csvpy utility')
makedepends=('git'
             'python-setuptools'
             'python-sphinx')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/wireservice/${pkgname/-/.}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
    python setup.py build_sphinx
    _rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
    rm -rvf "build/sphinx/html/_static"
    ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "build/sphinx/html/_static"
}

check() {
    cd "$pkgname"
    python setup.py test
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir -p "$pkgdir/usr/share/doc"
    cp -rv "build/sphinx/html" "$pkgdir/usr/share/doc/$pkgname"
}
