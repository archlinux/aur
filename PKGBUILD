# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-html
pkgver=2.0.1
pkgrel=1
pkgdesc="Plugin for generating HTML reports for pytest results"
url="https://github.com/pytest-dev/pytest-html"
arch=('any')
license=('MPL2')
depends=('python-pytest' 'python-pytest-metadata')
optdepends=('python-ansi2html: ANSI code support')
makedepends=('python-setuptools')
checkdepends=('python-pytest-mock' 'python-pytest-rerunfailures' 'python-pytest-xdist')
source=(
  "https://files.pythonhosted.org/packages/source/p/pytest-html/pytest-html-$pkgver.tar.gz"
)
sha256sums=(
  "933da7a5e71e5eace9e475441ed88a684f20f6198aa36516cb947ac05edd9921"
)

build() {
    cd "pytest-html-$pkgver"
    python setup.py build
}

check() {
    cd "pytest-html-$pkgver"

    # A lot of the tests use the subprocess module to run another instance of
    # pytest. In order for those instances to find the pytest_html plugin, its
    # entry point needs to be registered. To do this, write the egg_info folder
    # (which includes the entry points) to the library build location...
    python setup.py egg_info -e build/lib

    # ... and then run the tests with that location at the start of the path.
    # We don't want the tests to write byte code as they will have references
    # to $srcdir and not be world-readable.
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" PYTHONDONTWRITEBYTECODE=1 pytest -v -r a

    # Remove our egg_info directory so it doesn't get packaged.
    rm -r "build/lib/pytest_html.egg-info"
}

package() {
    cd "pytest-html-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 {CHANGES.rst,README.rst}
}
