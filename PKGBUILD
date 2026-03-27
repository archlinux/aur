# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=(gambit python-pygambit)
pkgver=16.6.0
pkgrel=1
pkgdesc="Tools for doing computation in game theory"
arch=('i686' 'x86_64')
url='https://github.com/gambitproject/gambit'
license=('GPL-2.0-or-later')
depends=('gcc-libs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'cython')
checkdepends=(
    'python-numpy'
    'python-scipy'
    'jupyter-nbclient'
    'jupyter-nbformat'
    'python-ipykernel'
    'python-pytest'
    'python-pandas'
    'python-pytest-subtests')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d0ac6809841b02347b31accfb6ee31d6ae0593f33dcf58b71b9ca543b465fd9')

build() {
    cd "$pkgname-$pkgver"

    aclocal
    libtoolize
    automake --add-missing
    autoconf
    ./configure --prefix=/usr --disable-enumpoly
    make

    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
}

package_gambit() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

package_python-pygambit() {
    depends+=('python-numpy' 'python-scipy' 'python-pandas')
    cd "$pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
