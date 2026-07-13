# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=(gambit python-pygambit)
pkgver=16.7.0
pkgrel=1
pkgdesc="Tools for doing computation in game theory"
arch=(i686 x86_64)
url='https://github.com/gambitproject/gambit'
license=(GPL-2.0-or-later)
depends=(libgcc libgcc_s.so)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(
    python-numpy
    python-scipy
    jupyter-nbclient
    jupyter-nbformat
    python-ipykernel
    python-pytest
    python-pandas
    python-pytest-subtests)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0d7c807b40cdc0d52c23e1585a4472da2c87ca63e306c4c00b55bf21841f9ce0')

build() {
    cd "$pkgname-$pkgver"

    aclocal
    libtoolize
    automake --add-missing
    autoconf
    ./configure --prefix=/usr
    make

    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x
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
