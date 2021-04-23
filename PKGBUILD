# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

pkgname=subliminal-git
pkgver=2.1.0.r22.g160ea63
pkgrel=2
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=('any')
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit' 'python-babelfish'  'python-enzyme' 'python-beautifulsoup4'
         'python-requests' 'python-click' 'python-dogpile.cache' 'python-stevedore'
         'python-chardet'  'python-pysrt' 'python-six' 'python-appdirs' 'python-rarfile'
         'python-pytz')
makedepends=('git' 'python-setuptools' 'python-sphinxcontrib-programoutput'
             'python-sphinx_rtd_theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Diaoul/subliminal.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's/SPHINXOPTS    = -n -W/SPHINXOPTS    = -n/g' docs/Makefile
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build

    cd "$srcdir/${pkgname%-git}/docs"
    make man
}

package() {
    cd "$srcdir/${pkgname%-git}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "docs/_build/man/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}

