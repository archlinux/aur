# Maintainer: gesh <gesh@gesh.uni.cx>
# Contributor: sasvari

pkgname=python-bibtexparser-git
_pkgname="${pkgname%-git}"
pkgrel=2
pkgver=2.0.0b8.r0.gb379599
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LicenseRef-MIT')
depends=('python' 'python-pylatexenc')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
)
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("python-bibtexparser=$pkgver")
conflicts=("python-bibtexparser")
source=("git+https://github.com/sciunto-org/python-bibtexparser.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname"

    export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
    python -m pytest -p pytest_cov
}

package() {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
