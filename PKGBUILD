# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=gambit-git
pkgname=(gambit-git python-pygambit-git)
pkgver=16.6.0.r12.g00c2d404d
pkgrel=1
pkgdesc="Tools for doing computation in game theory"
arch=('i686' 'x86_64')
url='https://github.com/gambitproject/gambit'
license=('GPL-2.0-or-later')
depends=('gcc-libs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'cython' 'git')
checkdepends=(
    'python-numpy'
    'python-scipy'
    'jupyter-nbclient'
    'jupyter-nbformat'
    'python-ipykernel'
    'python-pytest'
    'python-pandas'
    'python-pytest-subtests')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
    git -C "$pkgbase" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$pkgbase"

    aclocal
    libtoolize
    automake --add-missing
    autoconf
    ./configure --prefix=/usr --disable-enumpoly
    make

    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgbase"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
}

package_gambit-git() {
    provides=('gambit')
    conflicts=('gambit')
    cd "$pkgbase"
    make DESTDIR="$pkgdir/" install
}

package_python-pygambit-git() {
    depends+=('python-numpy' 'python-scipy' 'python-pandas')
    provides=('python-pygambit')
    conflicts=('python-pygambit')
    cd "$pkgbase"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
