# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

pkgname=subliminal-git
pkgver=2.1.0.r25.gaf3b8bd
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=('any')
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit' 'python-babelfish'  'python-enzyme' 'python-beautifulsoup4'
         'python-requests' 'python-click' 'python-dogpile.cache' 'python-stevedore'
         'python-chardet'  'python-srt' 'python-six' 'python-appdirs' 'python-rarfile'
         'python-pytz' 'python-importlib_resources')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools'
             'python-sphinxcontrib-programoutput' 'python-sphinx_rtd_theme' 'python-wheel')
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
    python -m build --wheel --no-isolation

    cd "$srcdir/${pkgname%-git}/docs"
    make man
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "docs/_build/man/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}

