# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-raccoon
pkgver=3.0.0
pkgrel=1
pkgdesc="Python DataFrame with fast insert and appends"
url="https://raccoon.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-tabulate')
optdepends=('python-blist: performance improvements for modifying large lists')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/r/raccoon/raccoon-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/rsheftel/raccoon/master/LICENSE"
)
sha256sums=(
  '224df0afa23c85847b0d9c0ef90d9e1270bd958742af5764daa731448e0dba87'
  'a96e75fc0f88ed8bad941facf1548a78e3fe68bf374fe2dbf0baaa535c758a5c'
)

build() {
    cd "raccoon-$pkgver"
    python setup.py build
}

check() {
    cd "raccoon-$pkgver"

    # Raccoon uses pkg_resources to get its version information, so the
    # distribution details must be available for the tests to run.
    python setup.py egg_info -e build/lib

    # Run the tests on the version to be installed, but don't write the compiled
    # byte code of the modules here (it would include references to $srcdir).
    PYTHONPATH="build/lib" PYTHONDONTWRITEBYTECODE=1 pytest -v tests/

    # Remove the egg_info we installed for testing.
    rm -r "build/lib/raccoon.egg-info"
}

package() {
    cd "raccoon-$pkgver"

    # Install the library.
    python setup.py install --root="$pkgdir" --prefix=/usr --skip-build --optimize=1

    # Install the license and readme.
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
